//
//  HomeViewCell.swift
//  winstrike
//
//  Created by Eugen K on 08/02/2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {

    private let headerLabel = UILabel()
    private let picture = UIImageView()
    private let simpleLabel = UILabel()
    private let vipLabel = UILabel()
    private let eventLabel = UILabel()
    private let watchButton = UIButton()
    private let container = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(container.prepareForAutoLayout())
        container.pinToSuperview([.bottom, .top])
        container.leadingAnchor ~= contentView.leadingAnchor + 40
        container.trailingAnchor ~= contentView.trailingAnchor - 40

        headerLabel.configureLabel(font: UIFont.wnsStemBold(size: 15), textColor: .black, text: "Компьютерный клуб «Master»")
        container.addSubview(headerLabel.prepareForAutoLayout())
        headerLabel.topAnchor ~= container.topAnchor + 10
        headerLabel.leadingAnchor ~= container.leadingAnchor + 10
        headerLabel.trailingAnchor ~= container.trailingAnchor - 10

        picture.layer.cornerRadius = 45
        picture.backgroundColor = .gray
        container.addSubview(picture.prepareForAutoLayout())
        picture.leadingAnchor ~= headerLabel.leadingAnchor
        picture.trailingAnchor ~= headerLabel.trailingAnchor
        picture.topAnchor ~= headerLabel.bottomAnchor + 10
        picture.heightAnchor ~= 140
        picture.image = Asset.clubOneExample.image

        container.addSubview(watchButton.prepareForAutoLayout())
        watchButton.heightAnchor ~= 40
        watchButton.widthAnchor ~= 140
        watchButton.trailingAnchor ~= headerLabel.trailingAnchor
        watchButton.topAnchor ~= picture.bottomAnchor + 40
        watchButton.layoutIfNeeded()
        watchButton.configureGradientButton(title: "Смотреть", 20)

        simpleLabel.configureLabel(font: UIFont.wnsStemMedium(size: 10), textColor: .black, text: "Обычное: 400р")
        container.addSubview(simpleLabel.prepareForAutoLayout())
        simpleLabel.leadingAnchor ~= headerLabel.leadingAnchor
        simpleLabel.trailingAnchor ~= watchButton.trailingAnchor - 10
        simpleLabel.topAnchor ~= picture.bottomAnchor + 24

        vipLabel.configureLabel(font: UIFont.wnsStemMedium(size: 10), textColor: .black, text: "VIP: 1200р")
        container.addSubview(vipLabel.prepareForAutoLayout())
        vipLabel.leadingAnchor ~= headerLabel.leadingAnchor
        vipLabel.trailingAnchor ~= watchButton.trailingAnchor - 10
        vipLabel.topAnchor ~= simpleLabel.bottomAnchor + 10

        eventLabel.configureLabel(font: UIFont.wnsStemMedium(size: 10), textColor: .black, text: "Event: 1200р")
        container.addSubview(eventLabel.prepareForAutoLayout())
        eventLabel.leadingAnchor ~= headerLabel.leadingAnchor
        eventLabel.trailingAnchor ~= watchButton.trailingAnchor - 10
        eventLabel.topAnchor ~= vipLabel.bottomAnchor + 10
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
