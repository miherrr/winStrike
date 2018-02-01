//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol StartViewInput: class {

    func setupInitialState()
}

protocol StartViewOutput {

    func viewIsReady()
    func nextButtonTap()
}
