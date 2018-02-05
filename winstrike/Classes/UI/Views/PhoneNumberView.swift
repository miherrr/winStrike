//
//  PhoneNumberView.swift
//  winstrike
//
//  Created by iOS on 02.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class PhoneNumberView: UIView {

    weak var delegate: ChooseSubviewDelegate?

    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = UIColor.wnsBlackFont
        return label
    }()

    fileprivate let changeButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.Winstrike.check.image, for: .selected)
        return button
    }()

    fileprivate let imageView = UIImageView()

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
        mainView.heightAnchor ~= 56
        mainView.backgroundColor = UIColor.wnsLightGrey

        mainView.addSubview(imageView.prepareForAutoLayout())
        imageView.centerYAnchor ~= mainView.centerYAnchor
        imageView.leadingAnchor ~= mainView.leadingAnchor + 14
        imageView.heightAnchor ~= 36

        if let image = item.image {
            imageView.widthAnchor ~= 36
            imageView.image = image
            imageView.contentMode = .center
            imageIsNotNil = true
        }

        mainView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.centerYAnchor ~= mainView.centerYAnchor
        if imageIsNotNil {
            titleLabel.leadingAnchor ~= imageView.trailingAnchor + 22
        } else {
            titleLabel.leadingAnchor ~= imageView.trailingAnchor + 11
        }
        titleLabel.text = item.title

        if isSelected {
            mainView.addSubview(changeButton.prepareForAutoLayout())
            changeButton.centerYAnchor ~= mainView.centerYAnchor
            changeButton.trailingAnchor ~= mainView.trailingAnchor - insetRight
            changeButton.widthAnchor ~= 18
            changeButton.heightAnchor ~= 18
            changeButton.isUserInteractionEnabled = false
            if item.isSelect {
                changeButton.isSelected = true
            }
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewHandlerTap))
        mainView.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @objc func viewHandlerTap() {
        changeButton.isSelected = !changeButton.isSelected
        delegate?.selectItem(changeButton.isSelected, tag: self.tag)
    }

    // MARK: - Public functions

    func setSelected(_ isSelect: Bool) {
        changeButton.isSelected = isSelect
    }
}

