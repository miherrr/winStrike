//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol HelperViewInput: class {

    func setupInitialState()
}

protocol HelperViewOutput {

    func viewIsReady()

    func backTap()

    func helpPhoneTap()

    func helpMailTap()
}
