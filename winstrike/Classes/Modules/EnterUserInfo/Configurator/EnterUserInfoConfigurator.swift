//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class EnterUserInfoConfigurator {

    static let tag: String = "EnterUserInfoTag"

    var provider: RxMoyaProvider<FoodleTarget>!

    var appRouter: AppRouterProtocol!

    func configureModule() -> UIViewController {
        let router = EnterUserInfoRouter()
        router.appRouter = appRouter

        let presenter = EnterUserInfoPresenter()
        presenter.router = router

        let interactor = EnterUserInfoInteractor()
        interactor.output = presenter

        let viewController = EnterUserInfoViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
