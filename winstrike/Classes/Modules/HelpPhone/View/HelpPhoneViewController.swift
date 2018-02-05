//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpPhoneViewController: ParentViewController {

    var output: HelpPhoneViewOutput!

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

        titleViewLabel.text = L10n.helpPhoneTitleText

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.backChevron.image, for: .normal)
        backButton.addTarget(self, action: #selector(backHandlerTap), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        addSubview()
    }

    func addSubview() {
        let realPhone = UILabel()
        realPhone.configureLabel(font: UIFont.wnsStemMedium(size: 15), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneRealPhone)
        view.addSubview(realPhone.prepareForAutoLayout())
        realPhone.leadingAnchor ~= view.leadingAnchor + 40
        realPhone.topAnchor ~= view.topAnchor + 24
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }
}

// MARK: - HelpPhoneViewInput

extension HelpPhoneViewController: HelpPhoneViewInput {

    func setupInitialState() {

    }
}
