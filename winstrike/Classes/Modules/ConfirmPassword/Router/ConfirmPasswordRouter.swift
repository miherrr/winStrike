//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class ConfirmPasswordRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - ConfirmPasswordRouterInput

extension ConfirmPasswordRouter: ConfirmPasswordRouterInput {
    func openExistingAccount() {
        print("router open existing account")
    }

    func openNext() {
        print("router open next")
    }
}
