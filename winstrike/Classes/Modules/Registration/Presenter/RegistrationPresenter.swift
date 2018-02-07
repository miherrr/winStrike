//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class RegistrationPresenter {

    weak var view: RegistrationViewInput!
    var interactor: RegistrationInteractorInput!
    var router: RegistrationRouterInput!
    weak var output: RegistrationModuleOutput?
}

// MARK: - RegistrationViewOutput

extension RegistrationPresenter: RegistrationViewOutput {
    func tapLoginButton() {
        print("assa")
    }

    func tapRegButton() {
        router.openRegUser()
    }

    func tapHelpButton() {
        router.openHelper()
    }

    func viewIsReady() {
        log.verbose("Registration is ready")
    }
}

// MARK: - RegistrationInteractorOutput

extension RegistrationPresenter: RegistrationInteractorOutput {

}
