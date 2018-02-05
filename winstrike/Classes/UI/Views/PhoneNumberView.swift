//
//  PhoneNumberView.swift
//  winstrike
//
//  Created by iOS on 02.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class PhoneNumberView: UIView {

    fileprivate let russiaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.wnsStemRegular(size: 15)
        label.tintColor = UIColor.wnsTextFieldPlderColor
        label.text = L10n.helpPhonePhonePlaceholder
        return label
    }()

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(item: ChooseListItem, tag: Int, isSelected: Bool = true) {
        super.init(frame: .zero)

        self.tag = tag
        backgroundColor = UIColor.white

        var imageIsNotNil = false

        var insetRight: CGFloat = 25

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, appDelegate.sizeOfScreen == .iphone5s {
            insetRight = 10
        }

        let mainView = UIView()
        addSubview(mainView.prepareForAutoLayout())
        mainView.pinEdgesToSuperviewEdges()
        mainView.heightAnchor ~= 48
        mainView.backgroundColor = UIColor.wnsLightGrey
        mainView.layer.cornerRadius = 28

//        mainView.addSubview(russiaLabel.prepareForAutoLayout())
//        russiaLabel.centerYAnchor ~= mainView.centerYAnchor
//        russiaLabel.

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

