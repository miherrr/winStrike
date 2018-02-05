//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpEmailViewController: ParentViewController {

    var output: HelpEmailViewOutput!

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

        titleViewLabel.text = L10n.helperTitleText

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.backChevron.image, for: .normal)
        backButton.addTarget(self, action: #selector(backHandlerTap), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }
}

// MARK: - HelpEmailViewInput

extension HelpEmailViewController: HelpEmailViewInput {

    func setupInitialState() {

    }
}
