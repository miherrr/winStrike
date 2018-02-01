//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpEmailConfigurator {

    static let tag: String = "HelpEmailTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = HelpEmailRouter()
        router.appRouter = appRouter

        let presenter = HelpEmailPresenter()
        presenter.router = router

        let interactor = HelpEmailInteractor()
        interactor.output = presenter

        let viewController = HelpEmailViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
