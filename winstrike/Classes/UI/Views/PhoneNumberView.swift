//
//  PhoneNumberView.swift
//  winstrike
//
//  Created by iOS on 02.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit
import InputMask

class PhoneNumberView: UIView {
    // swiftlint:disable:next weak_delegate
    private var maskedDelegate: MaskedTextFieldDelegate!

    fileprivate let phoneInputView = UITextField()
    fileprivate let separatorView = UIView()

    private let maskFormat = "([000]) [000]-[00]-[00]"

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(frame: .zero)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]

        backgroundColor = UIColor.white

        let mainView = UIView()
        addSubview(mainView.prepareForAutoLayout())
        mainView.pinEdgesToSuperviewEdges()
        mainView.backgroundColor = UIColor.wnsLightGrey
        mainView.layer.cornerRadius = 16

        let countryCodeLabel = UILabel()
        countryCodeLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: L10n.helpPhonePhonePlaceholder)
        mainView.addSubview(countryCodeLabel.prepareForAutoLayout())
        countryCodeLabel.centerYAnchor ~= mainView.centerYAnchor
        countryCodeLabel.leadingAnchor ~= mainView.leadingAnchor + 23
        countryCodeLabel.widthAnchor ~= 48

        let splitter = UIView()
        mainView.addSubview(splitter.prepareForAutoLayout())
        splitter.centerYAnchor ~= mainView.centerYAnchor
        splitter.leadingAnchor ~= countryCodeLabel.trailingAnchor + 15
        splitter.widthAnchor ~= 2
        splitter.heightAnchor ~= 20
        splitter.layer.cornerRadius = 2
        splitter.backgroundColor = UIColor.wnsGrey

        mainView.addSubview(phoneInputView.prepareForAutoLayout())
        phoneInputView.centerYAnchor ~= mainView.centerYAnchor
        phoneInputView.leadingAnchor ~= splitter.leadingAnchor + 16
        phoneInputView.trailingAnchor ~= mainView.trailingAnchor
        phoneInputView.heightAnchor ~= mainView.heightAnchor
        phoneInputView.backgroundColor = .clear
        phoneInputView.tintColor = UIColor.wnsHelperColor
        phoneInputView.font = UIFont.wnsStemRegular(size: 15)
        phoneInputView.keyboardType = .phonePad

        maskedDelegate = MaskedTextFieldDelegate(format: maskFormat)
        maskedDelegate?.listener = self
        phoneInputView.delegate = maskedDelegate
    }

    var phoneNumber: String {
        // swiftlint:disable:next force_unwrapping
        return "\(L10n.helpPhonePhoneCountryCode) \(phoneInputView.text!)"
    }
}

extension PhoneNumberView: MaskedTextFieldDelegateListener {
    func textField(_ textField: UITextField, didFillMandatoryCharacters complete: Bool, didExtractValue value: String) {
        print(value)
    }
}
