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
        print("router open enter existing account")
    }

    func openPhoneRegistrate() {
        print("open phone registrate")
    }

    func openEmailRegistrate() {
        print("open email registrate")
    }
}
