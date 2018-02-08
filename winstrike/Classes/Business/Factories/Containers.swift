//
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit
import Dip
import Moya
import RxMoya

enum Containers {
    case viewControllers
    case managers

    enum ViewControllerType: String, DependencyTagConvertible {
        case systemAlert
    }

    var container: DependencyContainer {
        switch self {
        case .viewControllers:
            return type(of: self).viewControllersContainer
        case .managers:
            return type(of: self).managersContainer
        }
    }

    private static let viewControllersContainer: DependencyContainer = {
        Dip.logLevel = .Errors

        let container = DependencyContainer()

        container.register(tag: ViewControllerType.systemAlert) { (data: AlertControllerData) -> UIViewController in
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            data.actions.forEach {
                alertController.addAction($0)
            }
            return alertController
        }

        container.register(tag: SplashConfigurator.tag) { () -> UIViewController in
            let configurator = SplashConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: StartConfigurator.tag) { () -> UIViewController in
            let configurator = StartConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: RegistrationConfigurator.tag) { () -> UIViewController in
            let configurator = RegistrationConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: HelperConfigurator.tag) { () -> UIViewController in
            let configurator = HelperConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: HelpPhoneConfigurator.tag) { () -> UIViewController in
            let configurator = HelpPhoneConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: HelpEmailConfigurator.tag) { () -> UIViewController in
            let configurator = HelpEmailConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: ChangePasswordConfigurator.tag) { (phoneNumber: String) -> UIViewController in
            let configurator = ChangePasswordConfigurator(phoneNumber: phoneNumber)
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: RegUserConfigurator.tag) { () -> UIViewController in
            let configurator = RegUserConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: ConfirmPasswordConfigurator.tag) { () -> UIViewController in
            let configurator = ConfirmPasswordConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        container.register(tag: EnterUserInfoConfigurator.tag) { () -> UIViewController in
            let configurator = EnterUserInfoConfigurator()
            configurator.appRouter = try managersContainer.resolve()
            configurator.provider = try managersContainer.resolve()
            return configurator.configureModule()
        }

        return container
    }()

    private static let managersContainer: DependencyContainer = {
        let container = DependencyContainer()

        container.register {
            try LogoutManagerImplementation(authTokenManager: container.resolve()) as LogoutManager
        }

        container.register {
            NotificationCenter.default
        }
        container.register {
            try LaunchManager(
                moduleCreator: container.resolve(),
                authTokenManager: container.resolve(),
                firstLaunchManager: container.resolve()
            ) as LaunchManagerProtocol
        }

        container.register { _ -> AppRouterProtocol in
            let router = try AppRouter(
                application: container.resolve(),
                factory: viewControllersContainer,
                moduleCreator: container.resolve()
            )
            router.dataSource = try container.resolve()
            return router as AppRouterProtocol
        }
        container.register { _ -> AppRouterModuleCreator in
            ModuleCreator(factory: viewControllersContainer) as AppRouterModuleCreator
        }
        container.register {
            UIApplication.shared
        }
        container.register { _ -> AppRouterFlowControllerDataSource in
            let application = try container.resolve() as UIApplication
            // swiftlint:disable:next force_cast
            return application.delegate as! AppRouterFlowControllerDataSource
        }
        container.register {
            AuthTokenManager() as AuthTokenManagerProtocol
        }
        container.register {
            FirstLaunchManager(userDefaults: UserDefaults.standard) as FirstLaunchManagerProtocol
        }
        container.register(tag: AuthTokenMoyaPlugin.tag) {
            AuthTokenMoyaPlugin(authTokenManager: try container.resolve()) as PluginType
        }

        enum NetworkPluginType: Int, DependencyTagConvertible {
            case indicator
        }

        container.register(tag: NetworkPluginType.indicator) { () -> PluginType in
            let application = try container.resolve() as UIApplication
            let networkIndicatorPlugin = NetworkActivityPlugin(networkActivityClosure: {
                switch $0 {
                case .began:
                    application.isNetworkActivityIndicatorVisible = true
                case .ended:
                    application.isNetworkActivityIndicatorVisible = false
                }
            })
            return networkIndicatorPlugin as PluginType
        }

        container.register { _ -> RxMoyaProvider<FoodleTarget> in
            let authTokenManager = try container.resolve() as AuthTokenManagerProtocol
            return RxMoyaProvider<FoodleTarget>(
                endpointClosure: { (target: FoodleTarget) -> Endpoint<FoodleTarget> in
                    /*let endpoint = Endpoint<FoodleTarget>(
                        url: target.baseURL.absoluteString + target.path,
                        sampleResponseClosure: {
                            .networkResponse(401, target.sampleData)
                        },
                        method: target.method,
                        parameters: target.parameters,
                        parameterEncoding: target.parameterEncoding
                    )*/
                    let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
                    var newHTTPHeaderFields: [String: String] = [:]
                    guard target.isRequiredAuth else {
                        log.debug("Auth token not needed")
                        return endpoint
                    }
                    guard let apiToken = authTokenManager.apiToken else {
                        log.warning("Api token not found")
                        return endpoint
                    }
                    newHTTPHeaderFields["Authorization"] = apiToken
                    newHTTPHeaderFields["Content-Type"] = "application/x-www-form-urlencoded"
                    return endpoint.adding(newHTTPHeaderFields: newHTTPHeaderFields)
                },
                stubClosure: { (target: FoodleTarget) -> Moya.StubBehavior in
                    switch target {
                    /*case .restaurants:
                        return .delayed(seconds: 3)*/
                    default:
                        return .never
                    }
                },
                plugins: [
                    NetworkLoggerPlugin(verbose: Configurations.current == .debug),
                    try container.resolve(tag: NetworkPluginType.indicator),
                    try container.resolve(tag: AuthTokenMoyaPlugin.tag)
                ]
            )
        }

        return container
    }()
}
