//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol RegistrationViewInput: class {

    func setupInitialState()
}

protocol RegistrationViewOutput {

    func viewIsReady()
}
