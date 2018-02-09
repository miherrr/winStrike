//
//  UIRoundedTextField.swift
//  winstrike
//
//  Created by PRS on 08/02/2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class UIRoundedTextField: UITextField {

    required init?(coder aDecoder: NSCoder) {
        fatalError("coder not supported")
    }

    init() {
        super.init(frame: .zero)
    }

    func configure(
        placeholder: String,
        isSecurity: Bool = false,
        cornerRadius: CGFloat = 16,
        keyboardType: UIKeyboardType = .alphabet) {
        configurePlaceholder(placeholder: placeholder)
        heightAnchor ~= 48
        if cornerRadius == 16 {
            widthAnchor ~= 288
        }
        backgroundColor = UIColor.wnsLightGrey
        layer.cornerRadius = cornerRadius
        isSecureTextEntry = isSecurity
        font = UIFont.wnsStemRegular(size: 15)
    }

    private func getPadding(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24))
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return getPadding(forBounds: bounds)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return getPadding(forBounds: bounds)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return getPadding(forBounds: bounds)
    }
}
