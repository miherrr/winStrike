//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelpPhoneViewController: ParentViewController {
    var timer: Timer!
    var isTimerRunning = false
    var seconds = 30

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
                      action: #selector(haveAccountTap),
                      firstString: L10n.parentHaveAccount,
                      secondString: L10n.parentEnterAccount)
    }

    // MARK: - Subviews
    // swiftlint:disable:next function_body_length
    func addSubview() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
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
        phoneNumberView.delegate = self

        phoneInputHint.configureLabel(font: UIFont.wnsStemLight(size: 13), textColor: UIColor.wnsGrey, text: L10n.helpPhonePhoneHelp)
        contentView.addSubview(phoneInputHint.prepareForAutoLayout())
        phoneInputHint.centerXAnchor ~= view.centerXAnchor
        phoneInputHint.topAnchor ~= phoneNumberView.bottomAnchor + 8

        contentView.addSubview(sendCodeBtn.prepareForAutoLayout())
        sendCodeBtn.addTarget(self, action: #selector(sendCodeTap), for: .touchUpInside)
        sendCodeBtn.topAnchor ~= phoneInputHint.bottomAnchor + 32
        sendCodeBtn.centerXAnchor ~= view.centerXAnchor
        sendCodeBtn.widthAnchor ~= 160
        sendCodeBtn.heightAnchor ~= 48
        sendCodeBtn.alpha = 0.5
        sendCodeBtn.layoutIfNeeded()
        sendCodeBtn.configureGradientButton(title: L10n.helpPhoneButtonSendCode)

        contentView.addSubview(sendCodeHint.prepareForAutoLayout())
        sendCodeHint.centerXAnchor ~= view.centerXAnchor
        sendCodeHint.isHidden = true
        sendCodeHint.topAnchor ~= sendCodeBtn.bottomAnchor + 19
        sendCodeHint.configureLabel(
            font: UIFont.wnsStemLight(size: 13),
            textColor: UIColor.wnsGrey,
            text: L10n.helpPhonePhoneSendCodeHint(String(seconds))
        )

        enterCodeCaption.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helpPhoneEnterCode)
        contentView.addSubview(enterCodeCaption.prepareForAutoLayout())
        enterCodeCaption.isHidden = true
        enterCodeCaption.leadingAnchor ~= view.leadingAnchor + 40
        enterCodeCaption.topAnchor ~= sendCodeHint.bottomAnchor + 32

        codeTextField.configure(placeholder: L10n.helpPhoneEnterCode, keyboardType: .numberPad)
        contentView.addSubview(codeTextField.prepareForAutoLayout())
        codeTextField.centerXAnchor ~= contentView.centerXAnchor
        codeTextField.topAnchor ~= enterCodeCaption.bottomAnchor + 16
        codeTextField.keyboardType = .numberPad
        codeTextField.isHidden = true
        codeTextField.delegate = self

        contentView.addSubview(confirmCodeBtn.prepareForAutoLayout())
        confirmCodeBtn.addTarget(self, action: #selector(confirmCodeTap), for: .touchUpInside)
        confirmCodeBtn.widthAnchor ~= 160
        confirmCodeBtn.heightAnchor ~= 48
        confirmCodeBtn.isHidden = true
        confirmCodeBtn.topAnchor ~= codeTextField.bottomAnchor + 32
        confirmCodeBtn.centerXAnchor ~= view.centerXAnchor
        confirmCodeBtn.layoutIfNeeded()
        confirmCodeBtn.configureGradientButton(title: L10n.helpPhoneConfirmCode)
    }

    // MARK: - Methods
    private func displayConfirmCodeSubView() {
        sendCodeHint.isHidden = false
        enterCodeCaption.isHidden = false
        codeTextField.isHidden = false
        confirmCodeBtn.isHidden = false
    }

    private func runSendCodeTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSendCodeTimer), userInfo: nil, repeats: true)
    }

    @objc func updateSendCodeTimer() {
        seconds -= 1
        sendCodeHint.text = L10n.helpPhonePhoneSendCodeHint(String(seconds))
        if seconds == 0 {
            timer.invalidate()
            sendCodeBtn.isEnabled = true
        }
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }

    @objc func confirmCodeTap() {
        output?.confirmCodeTap(phoneNumber: phoneNumberView.phoneNumber)
    }

    @objc func haveAccountTap() {
        output?.haveAccountTap()
    }

    @objc func sendCodeTap() {
        if phoneNumberView.validate() {
            print("phone number is valid")
            seconds = 30
            displayConfirmCodeSubView()
            runSendCodeTimer()
            sendCodeBtn.isEnabled = false
        } else {
            print("phone number is invalid")
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

                //здесь 233 - фиксированная высота клавиатуры
                offset = -(20 - (distBetweenConfirmBtnAndBottom - 233))
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if phoneNumberView.validate() {
            sendCodeBtn.alpha = 1.0
        } else {
            sendCodeBtn.alpha = 0.5
        }
        return true
    }
}

// MARK: - HelpPhoneViewInput

extension HelpPhoneViewController: HelpPhoneViewInput {

    func setupInitialState() {

    }
}
