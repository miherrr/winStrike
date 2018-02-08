//
// Created by Danila Lyahomskiy on 31/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class RegistrationViewController: ParentViewController {

    var output: RegistrationViewOutput!

    fileprivate let mainView = UIView()

    fileprivate let loginTF = UIRoundedTextField()

    fileprivate let passwordTF = UIRoundedTextField()

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBar(isWhite: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        addMainView()
        addButtons()
        addSocialView()
        addBottomView(target: self,
                      action: #selector(registrationHandleTap),
                      firstString: L10n.registrationDontHaveTitle,
                      secondString: L10n.registrationRegistrationButton)
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

        loginTF.configure(placeholder: L10n.registrationLoginTitle)
        loginTF.delegate = self
        mainView.addSubview(loginTF.prepareForAutoLayout())
        loginTF.centerXAnchor ~= mainView.centerXAnchor
        loginTF.topAnchor ~= logoImageView.bottomAnchor + 48

        passwordTF.configure(placeholder: L10n.registrationPasswordTitle, isSecurity: true)
        passwordTF.delegate = self
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

    // MARK: - Actions

    @objc func loginButtonHandleTap() {
        output?.tapLoginButton()
    }

    @objc func forgetButtonHandleTap() {
        output?.tapHelpButton()
    }

    @objc func registrationHandleTap() {
        output?.tapRegButton()
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
