//
// Created by Danila Lyahomskiy on 23/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class SplashRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - SplashRouterInput

extension SplashRouter: SplashRouterInput {
    func openStart() {
        appRouter.startView()
    }
}
