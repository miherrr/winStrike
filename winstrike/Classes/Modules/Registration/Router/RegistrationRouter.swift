//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class RegistrationRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - RegistrationRouterInput

extension RegistrationRouter: RegistrationRouterInput {
    func openHelper() {
        appRouter.startModule(from: .helper)
    }

    func openRegUser() {
        //non-breaking spaces
        appRouter.startModule(from: .confirmPassword(phoneNumber: "+7\u{00a0}(917)\u{00a0}994-52-15"))
    }

    func openHome() {
        appRouter.startModule(from: .home)
    }
}
