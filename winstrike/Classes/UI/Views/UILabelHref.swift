//
//  UILabelHref.swift
//  winstrike
//
//  Created by PRS on 09/02/2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class UILabelHref: UILabel {
    var stringsArray = [(action: (() -> Void)?, string: String)]()

    required init?(coder aDecoder: NSCoder) {
        fatalError("coder not supported")
    }

    init(stringsArray: [(action: (() -> Void)?, string: String)], tapTarget: Any?, secondColor: UIColor = UIColor.wnsPink) {
        super.init(frame: .zero)

        self.stringsArray = stringsArray

        //составим текст label, соединив части текста пробелами. При этом,
        //  если в конце части стоит перенос строки (\n), пробел не добавляем
        let title = stringsArray.map { $0.string }.joined(separator: " ").replacingOccurrences(of: "\n ", with: "\n")

        lineBreakMode = .byWordWrapping
        text = title
        numberOfLines = 0
        textAlignment = .center
        isUserInteractionEnabled = true
        tintColor = UIColor.wnsGrey

        configureAttributedText(text: title, secondColor: secondColor)

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(source:)))
        addGestureRecognizer(tap)
    }

    // MARK: - Views

    func configureAttributedText(text: String, secondColor: UIColor) {
        let mutableString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSAttributedStringKey.font: UIFont.wnsStemRegular(size: 15),
                NSAttributedStringKey.foregroundColor: UIColor.wnsGrey])

        for subString in stringsArray {
            //добавим розовый цвет, если у этого текста есть ссылка
            mutableString.addAttribute(
                NSAttributedStringKey.foregroundColor,
                value: (subString.action != nil ? secondColor : UIColor.wnsGrey),
                range: (text as NSString).range(of: subString.string))
            //добавим подчеркивание, если у этого текста есть сссылка
            if subString.action != nil {
                mutableString.addAttribute(
                    NSAttributedStringKey.underlineStyle,
                    value: NSUnderlineStyle.styleSingle.rawValue,
                    range: (text as NSString).range(of: subString.string))
            }
        }

        attributedText = mutableString
    }

    // MARK: - Actions

    @objc func tapLabel(source: UITapGestureRecognizer) {
        print("tap performed")
        for clickableString in stringsArray.filter ({ $0.0 != nil }) {
            // swiftlint:disable:next force_unwrapping
            let stringRange = (text! as NSString).range(of: clickableString.string)
            if source.didTapAttributedTextInLabel(label: self, inRange: stringRange) {
                clickableString.action?()
            }
        }
    }
}
