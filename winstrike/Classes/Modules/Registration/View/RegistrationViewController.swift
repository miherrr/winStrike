//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class RegistrationViewController: ParentViewController {

    var output: RegistrationViewOutput!

    fileprivate let mainView = UIView()

    fileprivate let loginTF = UIView()

    fileprivate let passwordTF = UIView()

    fileprivate let loginButton = UIButton()

    fileprivate let forgetButton = UIButton()

    fileprivate let socialStackView = SocialStackView(items: [.vkontakte, .facebook, .twitter, .steam])

    fileprivate let enterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.wnsStemRegular(size: 15)
        label.tintColor = UIColor.wnsTextFieldColor
        label.text = L10n.registrationLoginSocialTitle
        return label
    }()

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

        addMainView()
        addButtons()
        addSocialView()
        addBottomView()
    }

    private func addMainView() {
        view.addSubview(mainView.prepareForAutoLayout())
        mainView.centerYAnchor ~= view.centerYAnchor
        mainView.leadingAnchor ~= view.leadingAnchor
        mainView.trailingAnchor ~= view.trailingAnchor

        let logoImageView = UIImageView()
        logoImageView.image = Asset.Winstrike.label.image
        mainView.addSubview(logoImageView.prepareForAutoLayout())
        logoImageView.centerXAnchor ~= mainView.centerXAnchor
        logoImageView.topAnchor ~= mainView.topAnchor

        loginTF.configureView(placeholder: L10n.registrationLoginTitle, delegate: self)
        mainView.addSubview(loginTF.prepareForAutoLayout())
        loginTF.centerXAnchor ~= mainView.centerXAnchor
        loginTF.topAnchor ~= logoImageView.bottomAnchor + 48

        passwordTF.configureView(placeholder: L10n.registrationPasswordTitle, isSecurity: true, delegate: self)
        mainView.addSubview(passwordTF.prepareForAutoLayout())
        passwordTF.centerXAnchor ~= mainView.centerXAnchor
        passwordTF.topAnchor ~= loginTF.bottomAnchor + 24
        passwordTF.tag = 1
    }

    private func addButtons() {
        mainView.addSubview(loginButton.prepareForAutoLayout())
        loginButton.heightAnchor ~= 48
        loginButton.widthAnchor ~= 160
        loginButton.centerXAnchor ~= mainView.centerXAnchor
        loginButton.topAnchor ~= passwordTF.bottomAnchor + 24
        mainView.layoutSubviews()
        loginButton.layoutIfNeeded()
        loginButton.configureGradientButton(title: L10n.registrationLoginButton)
        loginButton.addTarget(self, action: #selector(loginButtonHandleTap), for: .touchUpInside)

        mainView.addSubview(forgetButton.prepareForAutoLayout())
        forgetButton.heightAnchor ~= 40
        forgetButton.widthAnchor ~= 260
        forgetButton.centerXAnchor ~= mainView.centerXAnchor
        forgetButton.topAnchor ~= loginButton.bottomAnchor + 14
        forgetButton.titleLabel?.font = UIFont.wnsStemMedium(size: 15)
        forgetButton.setTitleColor(UIColor.black, for: .normal)
        forgetButton.setTitle(L10n.registrationForgetButton, for: .normal)
        forgetButton.addTarget(self, action: #selector(forgetButtonHandleTap), for: .touchUpInside)
    }

    private func addSocialView() {
        mainView.addSubview(enterLabel.prepareForAutoLayout())
        enterLabel.centerXAnchor ~= mainView.centerXAnchor
        enterLabel.topAnchor ~= forgetButton.bottomAnchor + 24

        mainView.addSubview(socialStackView.prepareForAutoLayout())
        socialStackView.centerXAnchor ~= mainView.centerXAnchor
        socialStackView.topAnchor ~= enterLabel.bottomAnchor + 16
        socialStackView.bottomAnchor ~= mainView.bottomAnchor
        socialStackView.delegate = self
    }

    private func addBottomView() {

        let bottomView = UIView()
        view.addSubview(bottomView.prepareForAutoLayout())
        bottomView.bottomAnchor ~= view.bottomAnchor - 8
        bottomView.centerXAnchor ~= view.centerXAnchor
        bottomView.heightAnchor ~= 36

        let title: String = L10n.registrationDontHaveTitle + " " + L10n.registrationRegistrationButton

        let mutableString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.font: UIFont.wnsStemRegular(size: 15)])

        mutableString.addAttribute(
            NSAttributedStringKey.foregroundColor,
            value: UIColor.wnsGrey,
            range: NSRange(location: 0, length: L10n.registrationDontHaveTitle.count)
        )
        mutableString.addAttribute(
            NSAttributedStringKey.foregroundColor,
            value: UIColor.wnsPink,
            range: NSRange(location: L10n.registrationDontHaveTitle.count, length: L10n.registrationRegistrationButton.count + 1)
        )

        let label = UILabel()

        bottomView.addSubview(label.prepareForAutoLayout())
        label.centerYAnchor ~= bottomView.centerYAnchor
        label.trailingAnchor ~= bottomView.trailingAnchor
        label.leadingAnchor ~= bottomView.leadingAnchor
        label.attributedText = mutableString

        let tap = UITapGestureRecognizer(target: self, action: #selector(registrationHandleTap))
        bottomView.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @objc func loginButtonHandleTap() {
        print("loginButtonHandleTap")
    }

    @objc func forgetButtonHandleTap() {
        print("forgetButtonHandleTap")
    }

    @objc func registrationHandleTap() {
        print("registrationHandleTap")
    }
}

// MARK: - RegistrationViewInput

extension RegistrationViewController: RegistrationViewInput {

    func setupInitialState() {

    }
}

// MARK: - SocialStackViewDelegate

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

// MARK: - SocialStackViewDelegate

extension RegistrationViewController: SocialStackViewDelegate {

    func tapSocial(_ social: Social) {
        print("assa ", social.rawValue)
    }
}

// MARK: - UITextFieldExtension

private extension UITextField {

    func configure(placeholder: String) {
        self.font = UIFont.systemFont(ofSize: 15)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedStringKey.foregroundColor: UIColor.wnsTextFieldPlderColor]
        )
        self.textColor = UIColor.wnsTextFieldColor
    }
}

// MARK: - UIViewExtension

private extension UIView {
    func configureView(placeholder: String, isSecurity: Bool = false, delegate: UITextFieldDelegate) {
        self.heightAnchor ~= 48
        self.widthAnchor ~= 288
        self.backgroundColor = UIColor.wnsLightGrey
        self.layer.cornerRadius = 16.0
        let textField = UITextField()
        self.addSubview(textField.prepareForAutoLayout())
        textField.pinEdgesToSuperviewEdges(top: 0, left: 24, right: 24, bottom: 0)
        textField.configure(placeholder: placeholder)
        textField.isSecureTextEntry = isSecurity
        textField.tag = self.tag
        textField.delegate = delegate
    }
}
