//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HelpEmailPresenter {

    weak var view: HelpEmailViewInput!
    var interactor: HelpEmailInteractorInput!
    var router: HelpEmailRouterInput!
    weak var output: HelpEmailModuleOutput?
}

// MARK: - HelpEmailViewOutput

extension HelpEmailPresenter: HelpEmailViewOutput {

    func viewIsReady() {
        log.verbose("HelpEmail is ready")
    }

    func backTap() {
        router.back()
    }
}

// MARK: - HelpEmailInteractorOutput

extension HelpEmailPresenter: HelpEmailInteractorOutput {

}
