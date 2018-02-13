//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpEmailViewController: ParentViewController {

    var output: HelpEmailViewOutput!

    private let enterMailTitle = UILabel()

    private let enterMail = UIRoundedTextField()

    private let helpLabel = UILabel()

    private let sendButton = UIButton()

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapOutsideToHideKeyboard()
        output.viewIsReady()

        titleViewLabel.text = L10n.helpMailTitleText

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.backChevron.image, for: .normal)
        backButton.addTarget(self, action: #selector(backHandlerTap), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        addSubview()
        addBottomView(target: self,
                      action: #selector(loginButtonHandleTap),
                      firstString: L10n.parentHaveAccount,
                      secondString: L10n.parentEnterAccount)
    }

    private func addSubview() {
        enterMailTitle.configureLabel(font: UIFont.wnsStemMedium(size: 15), textColor: UIColor.wnsHelperColor, text: L10n.helpMailEnterEmail)
        view.addSubview(enterMailTitle.prepareForAutoLayout())
        enterMailTitle.leadingAnchor ~= view.leadingAnchor + 40
        enterMailTitle.topAnchor ~= view.topAnchor + 24

        enterMail.configure(placeholder: L10n.helpMailEmailPlaceholder, cornerRadius: 24)
        enterMail.delegate = self
        view.addSubview(enterMail.prepareForAutoLayout())
        enterMail.leadingAnchor ~= view.leadingAnchor + 40
        enterMail.trailingAnchor ~= view.trailingAnchor - 40
        enterMail.topAnchor ~= enterMailTitle.bottomAnchor + 21

        helpLabel.configureLabel(font: UIFont.wnsStemMedium(size: 13), textColor: UIColor.wnsLabelHelpColor, text: L10n.helpMailHelpText)
        helpLabel.numberOfLines = 0
        view.addSubview(helpLabel.prepareForAutoLayout())
        helpLabel.leadingAnchor ~= enterMail.leadingAnchor + 24
        helpLabel.trailingAnchor ~= enterMail.trailingAnchor - 24
        helpLabel.topAnchor ~= enterMail.bottomAnchor + 13

        view.addSubview(sendButton.prepareForAutoLayout())
        sendButton.centerXAnchor ~= view.centerXAnchor
        sendButton.topAnchor ~= helpLabel.bottomAnchor + 32
        sendButton.heightAnchor ~= 48
        sendButton.widthAnchor ~= 160

        sendButton.layoutSubviews()
        sendButton.layoutIfNeeded()
        sendButton.configureGradientButton(title: L10n.helpMailButtonSend)
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }

    @objc func loginButtonHandleTap() {
        if enterMail.validateEmail() {
            print("email is valid")
        } else {
            print("email is invalid")
        }
        // output?.tapLoginButton()
    }
}

// MARK: - HelpEmailViewInput

extension HelpEmailViewController: HelpEmailViewInput {

    func setupInitialState() {

    }
}

// MARK: - UITextFieldDelegate

extension HelpEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
