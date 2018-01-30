//
//  CityCell.swift
//  winstrike
//
//  Created by iOS on 29.01.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

// MARK: - CityCell

class CityCell: UITableViewCell {

    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.tintColor = UIColor.wnsBlackFont
        return label
    }()

    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        backgroundColor = .clear

        contentView.addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.pinEdgesToSuperviewEdges(top: 0, left: 24, right: 0, bottom: 0)
    }

    static var reuseIdentifier: String {
        return "CityCell"
    }
}
