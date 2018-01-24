//
// Created by Danila Lyahomskiy on 23/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class SplashPresenter {

    weak var view: SplashViewInput!
    var interactor: SplashInteractorInput!
    var router: SplashRouterInput!
    weak var output: SplashModuleOutput?
}

// MARK: - SplashViewOutput

extension SplashPresenter: SplashViewOutput {
    func finishAnimation() {
        router.openStart()
    }

    func viewIsReady() {
        log.verbose("Splash is ready")
    }
}

// MARK: - SplashInteractorOutput

extension SplashPresenter: SplashInteractorOutput {

}
