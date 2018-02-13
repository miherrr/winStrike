//
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit
import Dip
import RxSwift

struct AlertControllerData {
    var title: String?
    var message: String?
    var actions: [UIAlertAction]
}

enum AppRouterDestination {
    case systemAlert(data: AlertControllerData)
    case splash
    case start
    case registration
    case helper
    case helpPhone
    case helpEmail
    case changePassword(phoneNumber: String)
    case home
    case regUser
    case confirmPassword(phoneNumber: String)
    case enterUserInfo

    var isPresent: Bool {
        switch self {
        case .systemAlert:
            return true
//        case let .authCode(_, needToDismiss):
//            return needToDismiss
        default:
            return false
        }
    }

    var isTabView: Bool {
        return false
    }

    // swiftlint:disable:next cyclomatic_complexity
    fileprivate func constructModule(in factory: DependencyContainer) -> UIViewController {
        do {
            switch self {
            case let .systemAlert(data):
                return try factory.resolve(tag: Containers.ViewControllerType.systemAlert, arguments: data)
            case .splash:
                return try factory.resolve(tag: SplashConfigurator.tag)
            case .start:
                return try factory.resolve(tag: StartConfigurator.tag)
            case .registration:
                return try factory.resolve(tag: RegistrationConfigurator.tag)
            case .helper:
                return try factory.resolve(tag: HelperConfigurator.tag)
            case .helpPhone:
                return try factory.resolve(tag: HelpPhoneConfigurator.tag)
            case .helpEmail:
                return try factory.resolve(tag: HelpEmailConfigurator.tag)
            case let .changePassword(phoneNumber):
                return try factory.resolve(tag: ChangePasswordConfigurator.tag, arguments: phoneNumber)
            case .home:
                return try factory.resolve(tag: HomeConfigurator.tag)
            case .regUser:
                return try factory.resolve(tag: RegUserConfigurator.tag)
            case let .confirmPassword(phoneNumber):
                return try factory.resolve(tag: ConfirmPasswordConfigurator.tag, arguments: phoneNumber)
            case .enterUserInfo:
                return try factory.resolve(tag: EnterUserInfoConfigurator.tag)
            }
        } catch {
            fatalError("can't resolve module from factory")
        }
    }
}

protocol AppRouterProtocol {
    func transition(to destination: AppRouterDestination)

    func simpleTransition(to destination: AppRouterDestination)

    func dismissModule()

    func backTransition()

    func openSideMenu()

    func backToMain()

    func startModule(from destination: AppRouterDestination)

    func setRootViewController(viewControler: UINavigationController)
}

protocol AppRouterFlowControllerDataSource: class {
    func flowControllerForTransition() -> FlowControllerProtocol?
}

protocol AppRouterModuleCreator {
    func createModule(for destination: AppRouterDestination) -> UIViewController

    func createNavigationFlowController(viewController: UIViewController) -> FlowControllerProtocol
}

class AppRouter: AppRouterProtocol {

    fileprivate let disposeBag = DisposeBag()
    let application: UIApplication
    let factory: DependencyContainer
    let moduleCreator: AppRouterModuleCreator
    weak var dataSource: AppRouterFlowControllerDataSource?

    init(application: UIApplication, factory: DependencyContainer, moduleCreator: AppRouterModuleCreator) {
        self.application = application
        self.factory = factory
        self.moduleCreator = moduleCreator
    }

    func transition(to destination: AppRouterDestination) {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }

        let vc = moduleCreator.createModule(for: destination)
        transition(to: vc, flowController: flowController, destination: destination)
    }

    func simpleTransition(to destination: AppRouterDestination) {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }

        flowController.performTransition(to: destination).subscribe().addDisposableTo(disposeBag)
    }

    private func transition(
        to viewController: UIViewController,
        flowController: FlowControllerProtocol,
        destination: AppRouterDestination) {

        log.info("launch transition to view controller")

        if destination.isPresent {
            let childFlowController = moduleCreator.createNavigationFlowController(viewController: viewController)
            flowController.present(childFlowController: childFlowController, animated: true)
                .subscribe()
                .addDisposableTo(disposeBag)
        } else if destination.isTabView {
            flowController.performTransitionFromMain(to: viewController, animated: true)
                .subscribe()
                .addDisposableTo(disposeBag)
        } else {
            flowController.performTransition(to: viewController, animated: true)
                .subscribe()
                .addDisposableTo(disposeBag)
        }
    }

    func backToMain() {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }
        flowController.performTransitionToMain(animated: true)
            .subscribe()
            .addDisposableTo(disposeBag)
    }

    func openSideMenu() {
    }

    func backTransition() {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }

        flowController.performBackTransition(animated: true)
            .subscribe()
            .addDisposableTo(disposeBag)
    }

    func startModule(from destination: AppRouterDestination) {
        let mainViewController = moduleCreator.createModule(for: destination)

        let flowController = moduleCreator.createNavigationFlowController(viewController: mainViewController)

        if let appDelegate = application.delegate as? AppDelegate {
            appDelegate.rootFlowController = flowController
            appDelegate.window?.rootViewController = flowController.rootViewController
        }
    }

    func dismissModule() {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }

        flowController.dismissChildFlowController(animated: true)
            .subscribe()
            .addDisposableTo(disposeBag)
    }

    func setRootViewController(viewControler: UINavigationController) {
        guard let flowController = dataSource?.flowControllerForTransition() else {
            log.warning("can't receive flow controller for transition")
            return
        }
//        let navigationController = UINavigationController(rootViewController: viewControler)
        flowController.rootViewController = viewControler

        if let appDelegate = application.delegate as? AppDelegate {
            appDelegate.rootFlowController = flowController
        }
    }
}

class ModuleCreator: AppRouterModuleCreator {

    let factory: DependencyContainer

    init(factory: DependencyContainer) {
        self.factory = factory
    }

    func createModule(for destination: AppRouterDestination) -> UIViewController {
        return destination.constructModule(in: factory)
    }

    func createNavigationFlowController(viewController: UIViewController) -> FlowControllerProtocol {
        return NavigationFlowController(rootViewController: viewController, moduleCreator: self)
    }
}
