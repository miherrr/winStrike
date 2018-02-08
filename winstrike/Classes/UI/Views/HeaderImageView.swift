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
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        heightAnchor ~= 195

        addSubview(imageView.prepareForAutoLayout())
        imageView.centerXAnchor ~= centerXAnchor
        imageView.centerYAnchor ~= centerYAnchor
        imageView.heightAnchor ~= 87
        imageView.widthAnchor ~= imageView.heightAnchor

        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 5
        imageView.layer.cornerRadius = 87 / 2
        imageView.layer.masksToBounds = true

        imageView.contentMode = .center
    }
}
