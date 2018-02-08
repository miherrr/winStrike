//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class EnterUserInfoViewController: ParentViewController {

    var output: EnterUserInfoViewOutput!

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - EnterUserInfoViewInput

extension EnterUserInfoViewController: EnterUserInfoViewInput {

    func setupInitialState() {

    }
}
