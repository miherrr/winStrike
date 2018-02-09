//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class RegUserViewController: ParentViewController {

    var output: RegUserViewOutput!

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

    override var prefersStatusBarHidden: Bool {
        return false
    }
}

// MARK: - RegUserViewInput

extension RegUserViewController: RegUserViewInput {

    func setupInitialState() {

    }
}
