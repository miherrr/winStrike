//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

class HelpPhoneRouter {

    var appRouter: AppRouterProtocol!
}

// MARK: - HelpPhoneRouterInput

extension HelpPhoneRouter: HelpPhoneRouterInput {
    func back() {
        appRouter.backTransition()
    }
}
