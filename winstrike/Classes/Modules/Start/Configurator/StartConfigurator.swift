//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class StartConfigurator {

    static let tag: String = "StartTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = StartRouter()
        router.appRouter = appRouter

        let presenter = StartPresenter()
        presenter.router = router

        let interactor = StartInteractor()
        interactor.output = presenter

        let viewController = StartViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
