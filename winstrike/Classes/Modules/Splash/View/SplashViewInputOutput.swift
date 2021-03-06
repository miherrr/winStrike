//
// Created by Danila Lyahomskiy on 23/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol SplashViewInput: class {

    func setupInitialState()
}

protocol SplashViewOutput {

    func viewIsReady()

    func finishAnimation()
}
