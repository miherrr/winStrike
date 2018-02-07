//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class RegUserConfigurator {

    static let tag: String = "RegUserTag"

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = RegUserRouter()
        router.appRouter = appRouter

        let presenter = RegUserPresenter()
        presenter.router = router

        let interactor = RegUserInteractor()
        interactor.output = presenter

        let viewController = RegUserViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
