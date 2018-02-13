//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol ChangePasswordViewInput: class {

    func setupInitialState()
}

protocol ChangePasswordViewOutput {
    func backTap()
    func viewIsReady()
    func tapLoginButton()
}
