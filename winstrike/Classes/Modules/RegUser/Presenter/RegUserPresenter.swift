//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class RegUserPresenter {

    weak var view: RegUserViewInput!
    var interactor: RegUserInteractorInput!
    var router: RegUserRouterInput!
    weak var output: RegUserModuleOutput?
}

// MARK: - RegUserViewOutput

extension RegUserPresenter: RegUserViewOutput {
    func phoneNextButtonTap(phoneNumber: String) {
        router.openPhoneRegistrate(phoneNumber: phoneNumber)
    }

    func emailNextButtonTap() {
        router.openEmailRegistrate()
    }

    func existingAccountTap() {
        router.openEnterAccount()
    }

    func viewIsReady() {
        log.verbose("RegUser is ready")
    }
}

// MARK: - RegUserInteractorOutput

extension RegUserPresenter: RegUserInteractorOutput {

}
