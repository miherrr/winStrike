//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class ChangePasswordViewController: ParentViewController {

    var output: ChangePasswordViewOutput!

    let phoneNumber: String

    private let titleLabel = UILabel()

    private let phoneLabel = UILabel()

    private let phoneTF = UIView()

    private let applyButton = UIButton()

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBar(isWhite: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeStatusBar(isWhite: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        titleViewLabel.text = L10n.changePasswordTitleText

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.backChevron.image, for: .normal)
//        backButton.addTarget(self, action: #selector(backHandlerTap), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)

        addSubview()
        addBottomView()
    }

    private func addSubview() {
        titleLabel.configureAttributedString(firstString: L10n.changePasswordEnterPhone, secondString: phoneNumber, secondColor: .black)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.topAnchor ~= view.topAnchor + 20
        titleLabel.trailingAnchor ~= view.trailingAnchor - 40
        titleLabel.leadingAnchor ~= view.leadingAnchor + 40

        phoneLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: .wnsHelperColor, text: L10n.changePasswordPhoneTitle)
        view.addSubview(phoneLabel.prepareForAutoLayout())
        phoneLabel.topAnchor ~= titleLabel.bottomAnchor + 25
        phoneLabel.leadingAnchor ~= titleLabel.leadingAnchor

        phoneTF.configureTFView(placeholder: L10n.changePasswordPhonePlaceholder, isSecurity: true, delegate: self, cornerRadius: 24)
        view.addSubview(phoneTF.prepareForAutoLayout())
        phoneTF.topAnchor ~= phoneLabel.bottomAnchor + 16
        phoneTF.trailingAnchor ~= view.trailingAnchor - 40
        phoneTF.leadingAnchor ~= view.leadingAnchor + 40

        view.addSubview(applyButton.prepareForAutoLayout())
        applyButton.centerXAnchor ~= view.centerXAnchor
        applyButton.topAnchor ~= phoneTF.bottomAnchor + 32
        applyButton.heightAnchor ~= 48
        applyButton.widthAnchor ~= 160

        applyButton.layoutSubviews()
        applyButton.layoutIfNeeded()
        applyButton.configureGradientButton(title: L10n.changePasswordButtonApply)
    }

    private func addBottomView() {

        let bottomView = UIView()
        view.addSubview(bottomView.prepareForAutoLayout())
        bottomView.bottomAnchor ~= view.bottomAnchor - 8
        bottomView.centerXAnchor ~= view.centerXAnchor
        bottomView.heightAnchor ~= 36

        let label = UILabel()

        bottomView.addSubview(label.prepareForAutoLayout())
        label.centerYAnchor ~= bottomView.centerYAnchor
        label.trailingAnchor ~= bottomView.trailingAnchor
        label.leadingAnchor ~= bottomView.leadingAnchor
        label.configureAttributedString(firstString: L10n.changePasswordHaveAccount, secondString: L10n.changePasswordEnterAccount)

        //        let tap = UITapGestureRecognizer(target: self, action: #selector(registrationHandleTap))
        //        bottomView.addGestureRecognizer(tap)
    }
}

// MARK: - ChangePasswordViewInput

extension ChangePasswordViewController: ChangePasswordViewInput {

    func setupInitialState() {

    }
}

// MARK: - UITextFieldDelegate

extension ChangePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
