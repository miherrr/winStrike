//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class ConfirmPasswordConfigurator {

    static let tag: String = "ConfirmPasswordTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = ConfirmPasswordRouter()
        router.appRouter = appRouter

        let presenter = ConfirmPasswordPresenter()
        presenter.router = router

        let interactor = ConfirmPasswordInteractor()
        interactor.output = presenter

        let viewController = ConfirmPasswordViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
