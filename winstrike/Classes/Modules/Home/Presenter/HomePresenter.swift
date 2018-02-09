//
// Created by mkdk on 08/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HomePresenter {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    weak var output: HomeModuleOutput?
}

// MARK: - HomeViewOutput

extension HomePresenter: HomeViewOutput {

    func viewIsReady() {
        log.verbose("Home is ready")
    }
}

// MARK: - HomeInteractorOutput

extension HomePresenter: HomeInteractorOutput {

}
