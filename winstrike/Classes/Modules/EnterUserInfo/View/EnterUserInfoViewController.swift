//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class EnterUserInfoViewController: ParentViewController {

    var output: EnterUserInfoViewOutput!

    let contentView = UIView()
    let nameTextField = UIRoundedTextField()
    let passwordTextField = UIRoundedTextField()
    let nextButton = UIButton()
    var bottomLabel: UILabelHref!

    private var topViewConstraint: NSLayoutConstraint?
    private var screenSize: SizeScreen!

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Views

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapOutsideToHideKeyboard()
        output.viewIsReady()

        // swiftlint:disable:next force_unwrapping
        screenSize = ((UIApplication.shared.delegate as? AppDelegate)?.sizeOfScreen)!

        changeStatusBar(isWhite: true)
        addSubView()
        addBottomSubView()
    }

    func addSubView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        let topImageView = HeaderImageView()
        topImageView.type = .list
        contentView.addSubview(topImageView.prepareForAutoLayout())
        topImageView.centerXAnchor ~= contentView.centerXAnchor
        topImageView.topAnchor ~= contentView.topAnchor + 71
        topImageView.heightAnchor ~= 87
        topImageView.widthAnchor ~= contentView.widthAnchor

        let lastStepLabel = UILabel()
        contentView.addSubview(lastStepLabel.prepareForAutoLayout())
        lastStepLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: L10n.enterUserInfoLastStep)
        lastStepLabel.topAnchor ~= topImageView.bottomAnchor + 54
        lastStepLabel.leadingAnchor ~= contentView.leadingAnchor + 40

        nameTextField.configure(placeholder: L10n.enterUserInfoNamePlaceholder)
        contentView.addSubview(nameTextField.prepareForAutoLayout())
        nameTextField.centerXAnchor ~= contentView.centerXAnchor
        nameTextField.topAnchor ~= lastStepLabel.bottomAnchor + 48
        nameTextField.delegate = self

        passwordTextField.configure(placeholder: L10n.registrationPasswordTitle, isSecurity: true)
        contentView.addSubview(passwordTextField.prepareForAutoLayout())
        passwordTextField.centerXAnchor ~= contentView.centerXAnchor
        passwordTextField.topAnchor ~= nameTextField.bottomAnchor + 24
        passwordTextField.delegate = self

        contentView.addSubview(nextButton.prepareForAutoLayout())
        nextButton.topAnchor ~= (screenSize == .iphone5s ? passwordTextField.bottomAnchor + 30 : passwordTextField.bottomAnchor + 100)
        nextButton.centerXAnchor ~= contentView.centerXAnchor
        nextButton.widthAnchor ~= 160
        nextButton.heightAnchor ~= 48
        nextButton.layoutIfNeeded()
        nextButton.configureGradientButton(title: L10n.enterUserInfoNextBtn)
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
    }

    func addBottomSubView() {
        let stringsArray = [
            (nil, L10n.enterUserInfoRules1),
            (conditionsTap, L10n.enterUserInfoRules2),
            (nil, L10n.enterUserInfoRules3),
            (privacyTap, L10n.enterUserInfoRules4)
        ]

        let bottomLabel = UILabelHref(stringsArray: stringsArray)
        contentView.addSubview(bottomLabel.prepareForAutoLayout())

        bottomLabel.bottomAnchor ~= contentView.bottomAnchor - 15
        bottomLabel.centerXAnchor ~= contentView.centerXAnchor
        bottomLabel.widthAnchor ~= contentView.widthAnchor
    }

    // MARK: - Actions

    func conditionsTap() {
        output.conditionsButtonTap()
    }

    func privacyTap() {
        output.privacyButtonTap()
    }

    @objc func nextButtonTap() {
        output.nextButtonTap()
    }
}

// MARK: - UITextFieldDelegate

extension EnterUserInfoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.layoutSubviews()
        view.layoutIfNeeded()

        var offset = CGFloat()
        if screenSize == .iphone5s {
            offset = -180
        } else if screenSize == .iphoneX {
            offset = -50
        } else {
            let distBetweenConfirmBtnAndBottom = view.frame.size.height - nextButton.frame.origin.y - nextButton.frame.size.height

            //здесь 243 - фиксированная высота клавиатуры
            offset = -(20 - (distBetweenConfirmBtnAndBottom - 243))
        }

        topViewConstraint?.constant = offset
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        topViewConstraint?.constant = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

// MARK: - EnterUserInfoViewInput

extension EnterUserInfoViewController: EnterUserInfoViewInput {

    func setupInitialState() {

    }
}
