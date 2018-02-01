//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelperConfigurator {

    static let tag: String = "HelperTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = HelperRouter()
        router.appRouter = appRouter

        let presenter = HelperPresenter()
        presenter.router = router

        let interactor = HelperInteractor()
        interactor.output = presenter

        let viewController = HelperViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
