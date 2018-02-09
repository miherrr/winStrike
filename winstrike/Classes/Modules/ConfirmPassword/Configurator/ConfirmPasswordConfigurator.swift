//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class ConfirmPasswordConfigurator {

    static let tag: String = "ConfirmPasswordTag"

    var provider: RxMoyaProvider<FoodleTarget>!

    var appRouter: AppRouterProtocol!

    let phoneNumber: String

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    func configureModule() -> UIViewController {
        let router = ConfirmPasswordRouter()
        router.appRouter = appRouter

        let presenter = ConfirmPasswordPresenter()
        presenter.router = router

        let interactor = ConfirmPasswordInteractor()
        interactor.output = presenter

        let viewController = ConfirmPasswordViewController(phoneNumber: phoneNumber)
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
