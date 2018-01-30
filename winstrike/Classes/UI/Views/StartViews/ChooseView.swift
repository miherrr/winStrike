//
//  ChooseView.swift
//  winstrike
//
//  Created by iOS on 25.01.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

protocol ChooseViewDelegate: class {
    func changeStatus(_ isOpen: Bool, tag: Int)
}

class ChooseView: UIView {

    weak var delegate: ChooseViewDelegate?

    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = UIColor.wnsBlackFont
        return label
    }()

    fileprivate let changeButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.Winstrike.buttonDown.image, for: .normal)
        button.setImage(Asset.Winstrike.buttonUp.image, for: .selected)
        return button
    }()

    fileprivate let imageView = UIImageView()

    fileprivate var widthImageConstraint: NSLayoutConstraint?

    fileprivate var leftTitleConstraint: NSLayoutConstraint?

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(title: String) {
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        let insetRight: CGFloat = 24

        let mainView = UIView()
        addSubview(mainView.prepareForAutoLayout())
        mainView.pinEdgesToSuperviewEdges()
        mainView.heightAnchor ~= 56
        mainView.backgroundColor = UIColor.wnsLightGrey
        mainView.layer.cornerRadius = 16.0

        mainView.addSubview(imageView.prepareForAutoLayout())
        imageView.centerYAnchor ~= mainView.centerYAnchor
        imageView.leadingAnchor ~= mainView.leadingAnchor + 14
        imageView.heightAnchor ~= 36
        widthImageConstraint = imageView.widthAnchor.constraint(equalToConstant: 0)
        widthImageConstraint?.isActive = true
        imageView.contentMode = .center

        mainView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.centerYAnchor ~= mainView.centerYAnchor
        leftTitleConstraint = titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 11)
        leftTitleConstraint?.isActive = true
        titleLabel.text = title

        mainView.addSubview(changeButton.prepareForAutoLayout())
        changeButton.centerYAnchor ~= mainView.centerYAnchor
        changeButton.trailingAnchor ~= mainView.trailingAnchor - insetRight
        changeButton.widthAnchor ~= 16
        changeButton.heightAnchor ~= 16
        changeButton.isUserInteractionEnabled = false

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewHandlerTap))
        mainView.addGestureRecognizer(tap)
    }

    // MARK: - Actions

    @objc func viewHandlerTap() {
        changeButton.isSelected = !changeButton.isSelected
        delegate?.changeStatus(changeButton.isSelected, tag: self.tag)
    }

    // MARK: - Public function

    func setData(image: UIImage?, text: String) {
        imageView.image = image
        titleLabel.text = text

        changeButton.isSelected = false
        widthImageConstraint?.constant = 36
        leftTitleConstraint?.constant = 22
    }

    func close() {
        changeButton.isSelected = false
    }
}
