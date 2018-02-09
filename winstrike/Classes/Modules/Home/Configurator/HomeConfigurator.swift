//
// Created by mkdk on 08/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class HomeConfigurator {

    static let tag: String = "HomeTag"

    var appRouter: AppRouterProtocol!
    var provider: RxMoyaProvider<FoodleTarget>!

    func configureModule() -> UIViewController {
        let router = HomeRouter()
        router.appRouter = appRouter

        let presenter = HomePresenter()
        presenter.router = router

        let interactor = HomeInteractor()
        interactor.output = presenter

        let viewController = HomeViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
