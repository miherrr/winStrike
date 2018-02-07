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

    fileprivate let russiaLabel: UILabel = {
        let label = UILabel()
        label.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsTextFieldPlderColor, text: L10n.helpPhonePhonePlaceholder)
        return label
    }()

    fileprivate let separatorView = UIView()

    fileprivate let phoneField: UITextField = {
        let textFiled = UITextField()
        textFiled.configure(placeholder: "(***) ***-**-**")
        return textFiled
    }()

    var maskedDelegate: MaskedTextFieldDelegate?

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(frame: .zero)

        self.tag = tag
        backgroundColor = UIColor.white

        let mainView = UIView()
        addSubview(mainView.prepareForAutoLayout())
        mainView.pinEdgesToSuperviewEdges()
        mainView.heightAnchor ~= 48
        mainView.backgroundColor = UIColor.wnsLightGrey
        mainView.layer.cornerRadius = 24

        mainView.addSubview(russiaLabel.prepareForAutoLayout())
        russiaLabel.centerYAnchor ~= mainView.centerYAnchor
        russiaLabel.leadingAnchor ~= mainView.leadingAnchor + 23

        separatorView.backgroundColor = russiaLabel.textColor
        mainView.addSubview(separatorView.prepareForAutoLayout())
        separatorView.leadingAnchor ~= russiaLabel.trailingAnchor + 15
        separatorView.centerYAnchor ~= mainView.centerYAnchor
        separatorView.heightAnchor ~= 22
        separatorView.widthAnchor ~= 2

        mainView.addSubview(phoneField.prepareForAutoLayout())
        phoneField.leadingAnchor ~= separatorView.trailingAnchor + 15
        phoneField.centerYAnchor ~= mainView.centerYAnchor

//        mainView.addSubview(imageView.prepareForAutoLayout())
//        imageView.centerYAnchor ~= mainView.centerYAnchor
//        imageView.leadingAnchor ~= mainView.leadingAnchor + 14
//        imageView.heightAnchor ~= 36

//        if let image = item.image {
//            imageView.widthAnchor ~= 36
//            imageView.image = image
//            imageView.contentMode = .center
//            imageIsNotNil = true
//        }
//
//        mainView.addSubview(titleLabel.prepareForAutoLayout())
//        titleLabel.centerYAnchor ~= mainView.centerYAnchor
//        if imageIsNotNil {
//            titleLabel.leadingAnchor ~= imageView.trailingAnchor + 22
//        } else {
//            titleLabel.leadingAnchor ~= imageView.trailingAnchor + 11
//        }
//        titleLabel.text = item.title
    }

    // MARK: - Actions

    @objc func viewHandlerTap() {
//        changeButton.isSelected = !changeButton.isSelected
//        delegate?.selectItem(changeButton.isSelected, tag: self.tag)
    }

    // MARK: - Public functions

    func setSelected(_ isSelect: Bool) {
//        changeButton.isSelected = isSelect
    }
}

