//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol ConfirmPasswordRouterInput: BaseRouterInput {
    func openExistingAccount()
    func openNext()
}
