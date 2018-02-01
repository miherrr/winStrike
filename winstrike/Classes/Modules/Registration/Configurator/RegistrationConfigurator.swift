//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class RegistrationConfigurator {

    static let tag: String = "RegistrationTag"

    var appRouter: AppRouterProtocol!

    var provider: RxMoyaProvider<FoodleTarget>!

    func configureModule() -> UIViewController {
        let router = RegistrationRouter()
        router.appRouter = appRouter

        let presenter = RegistrationPresenter()
        presenter.router = router

        let interactor = RegistrationInteractor()
        interactor.output = presenter

        let viewController = RegistrationViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
