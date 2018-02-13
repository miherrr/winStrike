//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HelpPhonePresenter {

    weak var view: HelpPhoneViewInput!
    var interactor: HelpPhoneInteractorInput!
    var router: HelpPhoneRouterInput!
    weak var output: HelpPhoneModuleOutput?
}

// MARK: - HelpPhoneViewOutput

extension HelpPhonePresenter: HelpPhoneViewOutput {
    func confirmCodeTap(phoneNumber: String) {
        router.openChangePassword(phoneNumber: phoneNumber)
    }

    func backTap() {
        router.back()
    }

    func viewIsReady() {
        log.verbose("HelpPhone is ready")
    }

    func haveAccountTap() {
        router.openLoginPage()
    }
}

// MARK: - HelpPhoneInteractorOutput

extension HelpPhonePresenter: HelpPhoneInteractorOutput {

}
