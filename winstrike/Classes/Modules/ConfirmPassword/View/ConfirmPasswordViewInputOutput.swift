//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol ConfirmPasswordViewInput: class {

    func setupInitialState()
}

protocol ConfirmPasswordViewOutput {

    func viewIsReady()
}
