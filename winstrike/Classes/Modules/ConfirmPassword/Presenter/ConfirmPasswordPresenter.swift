//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class ConfirmPasswordPresenter {

    weak var view: ConfirmPasswordViewInput!
    var interactor: ConfirmPasswordInteractorInput!
    var router: ConfirmPasswordRouterInput!
    weak var output: ConfirmPasswordModuleOutput?
}

// MARK: - ConfirmPasswordViewOutput

extension ConfirmPasswordPresenter: ConfirmPasswordViewOutput {

    func viewIsReady() {
        log.verbose("ConfirmPassword is ready")
    }
}

// MARK: - ConfirmPasswordInteractorOutput

extension ConfirmPasswordPresenter: ConfirmPasswordInteractorOutput {

}
