//
// Created by mkdk on 08/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol HomeViewInput: class {

    func setupInitialState()
}

protocol HomeViewOutput {

    func viewIsReady()
}
