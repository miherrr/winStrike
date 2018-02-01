//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class StartPresenter {

    weak var view: StartViewInput!
    var interactor: StartInteractorInput!
    var router: StartRouterInput!
    weak var output: StartModuleOutput?
}

// MARK: - StartViewOutput

extension StartPresenter: StartViewOutput {
    func nextButtonTap() {
        router.openRegistration()
    }

    func viewIsReady() {
        log.verbose("Start is ready")
    }
}

// MARK: - StartInteractorOutput

extension StartPresenter: StartInteractorOutput {

}
