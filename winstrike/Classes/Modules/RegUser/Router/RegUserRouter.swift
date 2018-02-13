//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class RegUserRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - RegUserRouterInput

extension RegUserRouter: RegUserRouterInput {
    func openEnterAccount() {
        appRouter.startModule(from: .registration)
    }

    func openPhoneRegistrate(phoneNumber: String) {
        appRouter.transition(to: .confirmPassword(phoneNumber: phoneNumber))
        print("open phone registrate")
    }

    func openEmailRegistrate() {
        print("open email registrate")
        appRouter.transition(to: .enterUserInfo)
    }
}
