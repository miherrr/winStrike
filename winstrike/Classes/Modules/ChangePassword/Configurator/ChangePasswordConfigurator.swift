//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class ChangePasswordConfigurator {

    static let tag: String = "ChangePasswordTag"

    var appRouter: AppRouterProtocol!

    var provider: RxMoyaProvider<FoodleTarget>!

    let phoneNumber: String

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    func configureModule() -> UIViewController {
        let router = ChangePasswordRouter()
        router.appRouter = appRouter

        let presenter = ChangePasswordPresenter()
        presenter.router = router

        let interactor = ChangePasswordInteractor()
        interactor.output = presenter

        let viewController = ChangePasswordViewController(phoneNumber: phoneNumber)
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
