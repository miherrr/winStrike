//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpPhoneViewController: ParentViewController {

    var output: HelpPhoneViewOutput!
    let phoneNumberView = PhoneNumberView()
    let codeTextField = UITextField()
    private let confirmCodeBtn = UIButton()

    //поместим все в этот контейнер, потому что когда клавиатура появляется, нужно сдвинуть все элементы вверх, чтобы было видно TextField
    private let contentView = UIView()
    private var topViewConstraint: NSLayoutConstraint?

    let realPhone = UILabel()

    fileprivate let phoneNumberView = PhoneNumberView()

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
    }

    func addSubview() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges()
        //scrollSubstrate.isScrollEnabled = true
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        let realPhone = UILabel()
        realPhone.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneRealPhone)
        view.addSubview(realPhone.prepareForAutoLayout())
        realPhone.leadingAnchor ~= view.leadingAnchor + 40
        realPhone.topAnchor ~= contentView.topAnchor + 24

        contentView.addSubview(phoneNumberView.prepareForAutoLayout())
        phoneNumberView.topAnchor ~= realPhone.bottomAnchor + 16
        phoneNumberView.centerXAnchor ~= view.centerXAnchor
        phoneNumberView.widthAnchor ~= 288
        phoneNumberView.heightAnchor ~= 48

        let phoneInputHint = UILabel()
        phoneInputHint.configureLabel(font: UIFont.wnsStemLight(size: 13), textColor: UIColor.wnsGrey, text: L10n.helpPhonePhoneHelp)
        contentView.addSubview(phoneInputHint.prepareForAutoLayout())
        phoneInputHint.centerXAnchor ~= view.centerXAnchor
        phoneInputHint.topAnchor ~= phoneNumberView.bottomAnchor + 8

        let sendCodeBtn = UIButton()
        contentView.addSubview(sendCodeBtn.prepareForAutoLayout())
        sendCodeBtn.topAnchor ~= phoneInputHint.bottomAnchor + 32
        sendCodeBtn.centerXAnchor ~= view.centerXAnchor
        sendCodeBtn.widthAnchor ~= 160
        sendCodeBtn.heightAnchor ~= 48

        let sendCodeHint = UILabel()
        contentView.addSubview(sendCodeHint.prepareForAutoLayout())
        sendCodeHint.configureLabel(
            font: UIFont.wnsStemLight(size: 13),
            textColor: UIColor.wnsGrey,
            text: L10n.helpPhonePhoneSendCodeHint(String(30))
        )
        sendCodeHint.centerXAnchor ~= view.centerXAnchor
        sendCodeHint.topAnchor ~= sendCodeBtn.bottomAnchor + 19

        let enterCodeCaption = UILabel()
        enterCodeCaption.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneEnterCode)
        contentView.addSubview(enterCodeCaption.prepareForAutoLayout())
        enterCodeCaption.leadingAnchor ~= view.leadingAnchor + 40
        enterCodeCaption.topAnchor ~= sendCodeHint.bottomAnchor + 32

        let codeTextFieldSubstrate = UIView()
        contentView.addSubview(codeTextFieldSubstrate.prepareForAutoLayout())
        codeTextFieldSubstrate.backgroundColor = UIColor.wnsLightGrey
        codeTextFieldSubstrate.widthAnchor ~= 288
        codeTextFieldSubstrate.centerXAnchor ~= view.centerXAnchor
        codeTextFieldSubstrate.topAnchor ~= enterCodeCaption.bottomAnchor + 16
        codeTextFieldSubstrate.heightAnchor ~= 48
        codeTextFieldSubstrate.layer.cornerRadius = 24
        codeTextFieldSubstrate.addSubview(codeTextField.prepareForAutoLayout())
        codeTextField.pinEdgesToSuperviewEdges(top: 0, left: 24, right: 24, bottom: 0)
        codeTextField.font = UIFont.wnsStemRegular(size: 15)
        codeTextField.keyboardType = .numberPad
        codeTextField.delegate = self

        contentView.addSubview(confirmCodeBtn.prepareForAutoLayout())
        confirmCodeBtn.widthAnchor ~= 160
        confirmCodeBtn.heightAnchor ~= 48
        confirmCodeBtn.topAnchor ~= codeTextFieldSubstrate.bottomAnchor + 32
        confirmCodeBtn.centerXAnchor ~= view.centerXAnchor

        //устанавливаем градиент для обоих кнопок здесь, чтобы не просчитывать layout дважды
        sendCodeBtn.layoutIfNeeded()
        sendCodeBtn.configureGradientButton(title: L10n.helpPhoneButtonSendCode)
        confirmCodeBtn.layoutIfNeeded()
        confirmCodeBtn.configureGradientButton(title: L10n.helpPhoneConfirmCode)

        let existingAccountStack = UIStackView()
        contentView.addSubview(existingAccountStack.prepareForAutoLayout())
        existingAccountStack.distribution = .fill
        existingAccountStack.alignment = .center
        existingAccountStack.axis = .horizontal
        existingAccountStack.centerXAnchor ~= view.centerXAnchor
        existingAccountStack.bottomAnchor ~= view.bottomAnchor - 16

        let haveAccountLabel = UILabel()
        existingAccountStack.addArrangedSubview(haveAccountLabel)
        //к тексту добавим пробел, чтобы разделить два label
        haveAccountLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: "\(L10n.helpPhoneHaveAccount) ")
        let haveAccountEnterLabel = UnderlinedLabel()
        existingAccountStack.addArrangedSubview(haveAccountEnterLabel)
        haveAccountEnterLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsPink, text: L10n.helpPhoneEnterAccount)
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }

    @objc func tapOutside() {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight: Int = Int(keyboardSize.height)
            print("keyboardHeight", keyboardHeight)

            if codeTextField.isEditing {
                var offset = CGFloat()
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                if appDelegate?.sizeOfScreen == .iphone5s {
                    offset = -250
                } else if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                    view.layoutSubviews()
                    view.layoutIfNeeded()

                    //если это iphoneX, то прибавляем к клавиатуре еще 34, потому что она там большая
                    let keyboardHeight = keyboardSize.height + (appDelegate?.sizeOfScreen == .iphoneX ? 75 : 0)

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
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension HelpPhoneViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == codeTextField {
            topViewConstraint?.constant = 0
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

private class UnderlinedLabel: UILabel {
    override var text: String? {
        didSet {
            guard let text = text else {
                return
            }
            let textRange = NSMakeRange (0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            self.attributedText = attributedText
        }
    }
}

// MARK: - HelpPhoneViewInput

extension HelpPhoneViewController: HelpPhoneViewInput {

    func setupInitialState() {

    }
}
