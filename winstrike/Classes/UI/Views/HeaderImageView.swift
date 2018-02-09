//
//  HeaderImageView.swift
//  winstrike
//
//  Created by iOS on 08.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class HeaderImageView: UIView {

    private let imageView = UIImageView()

    var type: BigIcons = .phone {
        didSet {
            imageView.image = type.image()
        }
    }

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 87, height: 87))

        backgroundColor = UIColor.white

        let contentView = UIView()
        addSubview(contentView.prepareForAutoLayout())

        contentView.widthAnchor ~= 87
        contentView.heightAnchor ~= 87
        contentView.centerYAnchor ~= centerYAnchor
        contentView.backgroundColor = .white
        contentView.centerXAnchor ~= centerXAnchor
        contentView.centerYAnchor ~= centerYAnchor

        contentView.addSubview(imageView.prepareForAutoLayout())
        imageView.pinEdgesToSuperviewEdges()

        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowRadius = 10
        contentView.layer.cornerRadius = 87 / 2
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 4, height: 3.5)

        contentView.layoutIfNeeded()
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 87 / 2).cgPath

        imageView.contentMode = .center
    }
}
