//
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit
import Dip
import RxSwift

protocol LaunchManagerProtocol {
    func instantiateRootController(in window: UIWindow) -> Observable<FlowControllerProtocol>
}

class LaunchManager {

    let moduleCreator: AppRouterModuleCreator
    let authTokenManager: AuthTokenManagerProtocol
    var firstLaunchManager: FirstLaunchManagerProtocol

    fileprivate let disposeBag = DisposeBag()

    init(moduleCreator: AppRouterModuleCreator,
         authTokenManager: AuthTokenManagerProtocol,
         firstLaunchManager: FirstLaunchManagerProtocol) {

        self.moduleCreator = moduleCreator
        self.authTokenManager = authTokenManager
        self.firstLaunchManager = firstLaunchManager
    }
}

extension LaunchManager: LaunchManagerProtocol {
    func instantiateRootController(in window: UIWindow) -> Observable<FlowControllerProtocol> {
        return Observable<FlowControllerProtocol>.create { [unowned self] observer in

            let invokeSplashModule = { [unowned self] (window: UIWindow, observer: AnyObserver<FlowControllerProtocol>) in
                let module = self.moduleCreator.createModule(for: .splash)
                let flowController = self.moduleCreator.createNavigationFlowController(viewController: module)
                observer.onNext(flowController)
                self.animateRootControllerChange(in: window, viewController: flowController.rootViewController)
            }

            invokeSplashModule(window, observer)

            return Disposables.create()
        }
    }

    private func animateRootControllerChange(in window: UIWindow, viewController: UIViewController) {
        guard let snapshot = window.snapshotView(afterScreenUpdates: true) else {
            window.rootViewController = viewController
            return
        }

        viewController.view.addSubview(snapshot)
        window.rootViewController = viewController
        UIView.animate(withDuration: 0.3, animations: {
            snapshot.layer.opacity = 0
            snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: { _ in
            snapshot.removeFromSuperview()
        })
    }
}
