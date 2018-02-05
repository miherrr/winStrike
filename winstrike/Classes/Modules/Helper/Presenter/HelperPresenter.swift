//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HelperPresenter {

    weak var view: HelperViewInput!
    var interactor: HelperInteractorInput!
    var router: HelperRouterInput!
    weak var output: HelperModuleOutput?
}

// MARK: - HelperViewOutput

extension HelperPresenter: HelperViewOutput {
    func backTap() {
        router.back()
    }

    func helpPhoneTap() {
        router.openHelpPhone()
    }

    func helpMailTap() {
        router.openHelpMail()
    }

    func viewIsReady() {
        log.verbose("Helper is ready")
    }
}

// MARK: - HelperInteractorOutput

extension HelperPresenter: HelperInteractorOutput {

}
