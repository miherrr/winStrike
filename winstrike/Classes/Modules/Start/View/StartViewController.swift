//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class StartViewController: ParentViewController {

    var output: StartViewOutput!

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

// MARK: - StartViewInput

extension StartViewController: StartViewInput {

    func setupInitialState() {

    }
}
