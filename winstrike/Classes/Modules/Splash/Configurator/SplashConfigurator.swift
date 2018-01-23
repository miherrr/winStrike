//
// Created by Danila Lyahomskiy on 23/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class SplashConfigurator {

    static let tag: String = "SplashTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = SplashRouter()
        router.appRouter = appRouter

        let presenter = SplashPresenter()
        presenter.router = router

        let interactor = SplashInteractor()
        interactor.output = presenter

        let viewController = SplashViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
