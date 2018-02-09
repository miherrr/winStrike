//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class EnterUserInfoPresenter {

    weak var view: EnterUserInfoViewInput!
    var interactor: EnterUserInfoInteractorInput!
    var router: EnterUserInfoRouterInput!
    weak var output: EnterUserInfoModuleOutput?
}

// MARK: - EnterUserInfoViewOutput

extension EnterUserInfoPresenter: EnterUserInfoViewOutput {
    func conditionsButtonTap() {
        router.openConditions()
    }

    func privacyButtonTap() {
        router.openPrivacy()
    }

    func nextButtonTap() {
        router.openMain()
    }

    func viewIsReady() {
        log.verbose("EnterUserInfo is ready")
    }
}

// MARK: - EnterUserInfoInteractorOutput

extension EnterUserInfoPresenter: EnterUserInfoInteractorOutput {

}
