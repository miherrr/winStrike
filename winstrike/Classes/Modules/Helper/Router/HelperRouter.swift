//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HelperRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - HelperRouterInput

extension HelperRouter: HelperRouterInput {
    func back() {
        appRouter.startModule(from: .registration)
    }
    func openHelpPhone() {
        appRouter.transition(to: .helpPhone)
    }
    func openHelpMail() {
        appRouter.transition(to: .helpEmail)
    }
}
