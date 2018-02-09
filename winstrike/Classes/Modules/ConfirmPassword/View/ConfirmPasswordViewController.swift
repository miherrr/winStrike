//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class ConfirmPasswordViewController: ParentViewController {

    var output: ConfirmPasswordViewOutput!

    let contentView = UIView()
    let codeTextField = UIRoundedTextField()
    let nextButton = UIButton()

    private var topViewConstraint: NSLayoutConstraint?
    private var screenSize: SizeScreen!
    let phoneNumber: String

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }

//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }

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

    // MARK: - Views

    // swiftlint:disable:next function_body_length
    func addSubView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        let topImageView = HeaderImageView()
        topImageView.type = .lock
        contentView.addSubview(topImageView.prepareForAutoLayout())
        topImageView.centerXAnchor ~= contentView.centerXAnchor
        topImageView.topAnchor ~= contentView.topAnchor + 71
        topImageView.heightAnchor ~= 87
        topImageView.widthAnchor ~= contentView.widthAnchor

        let codeSentLabel = UILabel()
        contentView.addSubview(codeSentLabel.prepareForAutoLayout())
        codeSentLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsBlackFont, text: L10n.confirmPasswordCodeSent)
        codeSentLabel.topAnchor ~= topImageView.bottomAnchor + 54
        codeSentLabel.leadingAnchor ~= contentView.leadingAnchor + 40

        let codeSentMessageLabel = UILabel()
        contentView.addSubview(codeSentMessageLabel.prepareForAutoLayout())
        let title = L10n.confirmPasswordEnterCodeHint(phoneNumber)
        codeSentMessageLabel.configureLabel(
            font: UIFont.wnsStemRegular(size: 15),
            textColor: UIColor.wnsGrey,
            text: title)
        let mutableString = NSMutableAttributedString(string: title)
        mutableString.addAttribute(
            NSAttributedStringKey.foregroundColor,
            value: UIColor.wnsBlackFont,
            range: (title as NSString).range(of: phoneNumber))
        codeSentMessageLabel.attributedText = mutableString
        codeSentMessageLabel.numberOfLines = 0
        codeSentMessageLabel.topAnchor ~= codeSentLabel.bottomAnchor + 7
        codeSentMessageLabel.leadingAnchor ~= contentView.leadingAnchor + 40
        codeSentMessageLabel.trailingAnchor ~= contentView.trailingAnchor - 40

        codeTextField.configure(placeholder: L10n.confirmPasswordEnterCodePlaceholder, keyboardType: .numberPad)
        contentView.addSubview(codeTextField.prepareForAutoLayout())
        codeTextField.centerXAnchor ~= contentView.centerXAnchor
        codeTextField.topAnchor ~= codeSentMessageLabel.bottomAnchor + 40
        codeTextField.delegate = self

        contentView.addSubview(nextButton.prepareForAutoLayout())
        nextButton.topAnchor ~= codeTextField.bottomAnchor + (screenSize == .iphone5s ? 40 : 100)
        nextButton.centerXAnchor ~= contentView.centerXAnchor
        nextButton.widthAnchor ~= 160
        nextButton.heightAnchor ~= 48
        nextButton.layoutIfNeeded()
        nextButton.configureGradientButton(title: L10n.confirmPasswordNextButton)
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
    }

    func addBottomSubView() {
        let stringsArray = [
            (nil, L10n.parentHaveAccount),
            (haveAccountTap, L10n.parentEnterAccount)
        ]

        let bottomLabel = UILabelHref(stringsArray: stringsArray)
        contentView.addSubview(bottomLabel.prepareForAutoLayout())

        bottomLabel.bottomAnchor ~= contentView.bottomAnchor - 15
        bottomLabel.centerXAnchor ~= contentView.centerXAnchor
        bottomLabel.widthAnchor ~= contentView.widthAnchor
    }

    // MARK: - Actions

    func haveAccountTap() {
        print("have account tap")
    }

    @objc func nextButtonTap() {
        print("next button tap")
    }
}

// MARK: - UITextFieldDelegate

extension ConfirmPasswordViewController: UITextFieldDelegate {
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

// MARK: - ConfirmPasswordViewInput

extension ConfirmPasswordViewController: ConfirmPasswordViewInput {

    func setupInitialState() {

    }
}
