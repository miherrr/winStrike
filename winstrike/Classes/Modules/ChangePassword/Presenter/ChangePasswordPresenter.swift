//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class ChangePasswordPresenter {

    weak var view: ChangePasswordViewInput!
    var interactor: ChangePasswordInteractorInput!
    var router: ChangePasswordRouterInput!
    weak var output: ChangePasswordModuleOutput?
}

// MARK: - ChangePasswordViewOutput

extension ChangePasswordPresenter: ChangePasswordViewOutput {

    func viewIsReady() {
        log.verbose("ChangePassword is ready")
    }
}

// MARK: - ChangePasswordInteractorOutput

extension ChangePasswordPresenter: ChangePasswordInteractorOutput {

}
