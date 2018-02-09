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
        appRouter.startModule(from: .changePassword(phoneNumber: "+7 (919) 235-11-12"))
    }

    func openHome() {
        appRouter.startModule(from: .home)
    }
}
