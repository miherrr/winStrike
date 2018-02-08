//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpPhoneViewController: ParentViewController {

    var output: HelpPhoneViewOutput!
    let phoneNumberView = PhoneNumberView()
    let codeTextField = UIRoundedTextField()
    let confirmCodeBtn = UIButton()

    fileprivate let realPhone = UILabel()
    fileprivate let phoneInputHint = UILabel()
    fileprivate let sendCodeBtn = UIButton()
    fileprivate let sendCodeHint = UILabel()
    fileprivate let enterCodeCaption = UILabel()

    //поместим все в этот контейнер, потому что когда клавиатура появляется, нужно сдвинуть все элементы вверх, чтобы было видно TextField
    private let contentView = UIView()
    private var topViewConstraint: NSLayoutConstraint?

    //в эту переменную запишем высоту клавиатуры сразу после первого ее появления
    var keyboardHeight: CGFloat = 0

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

        let tapOutsideGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOutside))
        view.addGestureRecognizer(tapOutsideGesture)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

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
        addBottomView(target: self,
                      action: #selector(confirmCodeTap),
                      firstString: L10n.parentHaveAccount,
                      secondString: L10n.parentEnterAccount)
    }

    // MARK: - Subviews
    // swiftlint:disable:next function_body_length
    func addSubview() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        realPhone.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneRealPhone)
        view.addSubview(realPhone.prepareForAutoLayout())
        realPhone.leadingAnchor ~= view.leadingAnchor + 40
        realPhone.topAnchor ~= contentView.topAnchor + 24

        contentView.addSubview(phoneNumberView.prepareForAutoLayout())
        phoneNumberView.topAnchor ~= realPhone.bottomAnchor + 16
        phoneNumberView.centerXAnchor ~= view.centerXAnchor
        phoneNumberView.widthAnchor ~= 288
        phoneNumberView.heightAnchor ~= 48

        phoneInputHint.configureLabel(font: UIFont.wnsStemLight(size: 13), textColor: UIColor.wnsGrey, text: L10n.helpPhonePhoneHelp)
        contentView.addSubview(phoneInputHint.prepareForAutoLayout())
        phoneInputHint.centerXAnchor ~= view.centerXAnchor
        phoneInputHint.topAnchor ~= phoneNumberView.bottomAnchor + 8

        contentView.addSubview(sendCodeBtn.prepareForAutoLayout())
        sendCodeBtn.topAnchor ~= phoneInputHint.bottomAnchor + 32
        sendCodeBtn.centerXAnchor ~= view.centerXAnchor
        sendCodeBtn.widthAnchor ~= 160
        sendCodeBtn.heightAnchor ~= 48

        contentView.addSubview(sendCodeHint.prepareForAutoLayout())
        sendCodeHint.configureLabel(
            font: UIFont.wnsStemLight(size: 13),
            textColor: UIColor.wnsGrey,
            text: L10n.helpPhonePhoneSendCodeHint(String(30))
        )
        sendCodeBtn.layoutIfNeeded()
        sendCodeBtn.configureGradientButton(title: L10n.helpPhoneButtonSendCode)
        sendCodeHint.centerXAnchor ~= view.centerXAnchor
        sendCodeHint.topAnchor ~= sendCodeBtn.bottomAnchor + 19

        enterCodeCaption.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneEnterCode)
        contentView.addSubview(enterCodeCaption.prepareForAutoLayout())
        enterCodeCaption.leadingAnchor ~= view.leadingAnchor + 40
        enterCodeCaption.topAnchor ~= sendCodeHint.bottomAnchor + 32

        codeTextField.configure(placeholder: L10n.helpPhoneEnterCode, keyboardType: .numberPad)
        contentView.addSubview(codeTextField.prepareForAutoLayout())
        codeTextField.centerXAnchor ~= contentView.centerXAnchor
        codeTextField.topAnchor ~= enterCodeCaption.bottomAnchor + 16
        codeTextField.keyboardType = .numberPad
        codeTextField.delegate = self

        contentView.addSubview(confirmCodeBtn.prepareForAutoLayout())
        confirmCodeBtn.layoutIfNeeded()
        confirmCodeBtn.configureGradientButton(title: L10n.helpPhoneConfirmCode)
        confirmCodeBtn.addTarget(self, action: #selector(confirmCodeTap), for: .touchUpInside)
        confirmCodeBtn.widthAnchor ~= 160
        confirmCodeBtn.heightAnchor ~= 48
        confirmCodeBtn.topAnchor ~= codeTextField.bottomAnchor + 32
        confirmCodeBtn.centerXAnchor ~= view.centerXAnchor
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }

    @objc func tapOutside() {
        view.endEditing(true)
    }

    @objc func confirmCodeTap() {
        output?.confirmCodeTap(phoneNumber: phoneNumberView.phoneNumber)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - UITextFieldDelegate

extension HelpPhoneViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == codeTextField {
            view.layoutSubviews()
            view.layoutIfNeeded()

            var offset = CGFloat()
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            if appDelegate?.sizeOfScreen == .iphone5s {
                offset = -250
            } else if appDelegate?.sizeOfScreen == .iphoneX {
                offset = -20
            } else {
                //считаем расстояние от низа кнопки "подтвердить код" до низа вьюшки
                let distBetweenConfirmBtnAndBottom = view.frame.size.height - confirmCodeBtn.frame.origin.y - confirmCodeBtn.frame.size.height

                offset = -(20 - (distBetweenConfirmBtnAndBottom - keyboardHeight))
            }

            topViewConstraint?.constant = offset
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == codeTextField {
            topViewConstraint?.constant = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

// MARK: - HelpPhoneViewInput

extension HelpPhoneViewController: HelpPhoneViewInput {

    func setupInitialState() {

    }
}
