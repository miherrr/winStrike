//
//  ButtonExtension.swift
//  winstrike
//
//  Created by iOS on 30.01.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

extension UIButton {
    func configureGradientButton(title: String) {
        self.layer.borderWidth = 0

        let gradient = CAGradientLayer()
        let colorLeft = UIColor.wnsLeftGradientColor.cgColor
        let colorRight = UIColor.wnsRightGradientColor.cgColor

        gradient.colors = [colorLeft, colorRight]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.05)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.05)
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        gradient.cornerRadius = 16

        self.layer.cornerRadius = 16
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.titleLabel?.textColor = .white
        self.clipsToBounds = true
        self.layer.insertSublayer(gradient, at: 0)
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
    }
}

extension UILabel {
    func configureLabel(font: UIFont, textColor: UIColor, text: String) {
        self.font = font
        self.textColor = textColor
        self.text = text
    }

    func configureAttributedString(firstString: String, secondString: String) {
        let title: String = firstString + " " + secondString

        let mutableString = NSMutableAttributedString(string: title, attributes: [NSAttributedStringKey.font: UIFont.wnsStemRegular(size: 15)])

        mutableString.addAttribute(
            NSAttributedStringKey.foregroundColor,
            value: UIColor.wnsGrey,
            range: NSRange(location: 0, length: firstString.count)
        )
        mutableString.addAttribute(
            NSAttributedStringKey.foregroundColor,
            value: UIColor.wnsPink,
            range: NSRange(location: firstString.count, length:  secondString.count + 1)
        )

        self.attributedText = mutableString
    }
}

extension UITextField {

    func configure(placeholder: String) {
        self.font = UIFont.systemFont(ofSize: 15)
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedStringKey.foregroundColor: UIColor.wnsTextFieldPlderColor]
        )
        self.textColor = UIColor.wnsTextFieldColor
    }
}

extension UIView {
    func configureTFView(placeholder: String, isSecurity: Bool = false, delegate: UITextFieldDelegate, cornerRadius: CGFloat = 16) {
        self.heightAnchor ~= 48
        if cornerRadius == 16 {
            self.widthAnchor ~= 288
        }
        self.backgroundColor = UIColor.wnsLightGrey
        self.layer.cornerRadius = cornerRadius
        let textField = UITextField()
        self.addSubview(textField.prepareForAutoLayout())
        textField.pinEdgesToSuperviewEdges(top: 0, left: 24, right: 24, bottom: 0)
        textField.configure(placeholder: placeholder)
        textField.isSecureTextEntry = isSecurity
        textField.tag = self.tag
        textField.delegate = delegate
    }
}
