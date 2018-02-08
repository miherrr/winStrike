//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol EnterUserInfoViewInput: class {

    func setupInitialState()
}

protocol EnterUserInfoViewOutput {

    func viewIsReady()
}
