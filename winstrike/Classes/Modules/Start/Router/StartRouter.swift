//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class StartRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - StartRouterInput

extension StartRouter: StartRouterInput {
    func openRegistration() {
        appRouter.startModule(from: .registration)
    }
}
