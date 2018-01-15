//
// Created by Danila Lyahomskiy on 25/12/2017.
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit
import RxMoya

class ChatsConfigurator {

    static let tag: String = "ChatsTag"

    var appRouter: AppRouterProtocol!

    var provider: RxMoyaProvider<FoodleTarget>!

    func configureModule() -> UIViewController {
        let router = ChatsRouter()
        router.appRouter = appRouter

        let presenter = ChatsPresenter()
        presenter.router = router

        let interactor = ChatsInteractor()
        interactor.output = presenter

        let viewController = ChatsViewController()
        viewController.output = presenter

        presenter.interactor = interactor
        presenter.view = viewController

        return viewController
    }
}
