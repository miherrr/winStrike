//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import Foundation

protocol HelpPhoneViewInput: class {

    func setupInitialState()
}

protocol HelpPhoneViewOutput {

    func viewIsReady()

    func backTap()

    func confirmCodeTap(phoneNumber: String)
}
