//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import RxMoya

class HelpPhoneConfigurator {

    static let tag: String = "HelpPhoneTag"

    var appRouter: AppRouterProtocol!

    var provider: RxMoyaProvider<FoodleTarget>!

    func configureModule() -> UIViewController {
        let router = HelpPhoneRouter()
        router.appRouter = appRouter

        let presenter = HelpPhonePresenter()
        presenter.router = router

        let interactor = HelpPhoneInteractor()
        interactor.output = presenter

        let viewController = HelpPhoneViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
