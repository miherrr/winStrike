//
//  SocialStackView.swift
//  winstrike
//
//  Created by iOS on 01.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

protocol SocialStackViewDelegate: class {
    func tapSocial(_ social: Social)
}

class SocialStackView: UIView {

    weak var delegate: SocialStackViewDelegate?

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(items: [Social]) {
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        let buttonsArray: [UIButton] = items.map { configureButton(button: UIButton(), item: $0) }

        let stackView = createStackView(.horizontal, .fill, .fill, 20, with: buttonsArray)
        addSubview(stackView.prepareForAutoLayout())
        stackView.pinEdgesToSuperviewEdges()
    }

    private func configureButton(button: UIButton, item: Social) -> UIButton {
        button.tag = item.rawValue
        button.setImage(item.socilaImage(), for: .normal)
        button.addTarget(self, action: #selector(buttonHandlerTap), for: .touchUpInside)
        return button
    }

    @objc func buttonHandlerTap(sender: UIButton) {
        // swiftlint:disable:next force_unwrapping
        delegate?.tapSocial(Social(rawValue: sender.tag)!)
    }
}
