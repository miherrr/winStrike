//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class EnterUserInfoRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - EnterUserInfoRouterInput

extension EnterUserInfoRouter: EnterUserInfoRouterInput {
    func openPrivacy() {
        print("router open privacy")
    }

    func openConditions() {
        print("router open conditions")
    }

    func openMain() {
        print("router open main")
    }
}
