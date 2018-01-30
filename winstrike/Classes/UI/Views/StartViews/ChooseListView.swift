//
//  ChooseListView.swift
//  winstrike
//
//  Created by iOS on 26.01.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

protocol ChooseListViewDelegate: class {
    func setItem(_ index: Int)
}

class ChooseListView: UIView {

    weak var delegate: ChooseListViewDelegate?

    fileprivate var items: [ChooseListItem] = []

    fileprivate var widthImageConstraint: NSLayoutConstraint?

    fileprivate var leftTitleConstraint: NSLayoutConstraint?

    var viewsArray: [ChooseSubview] = []

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(items: [ChooseListItem]) {
        self.items = items
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        let mainView = UIView()
        addSubview(mainView.prepareForAutoLayout())
        mainView.pinEdgesToSuperviewEdges()
        mainView.backgroundColor = UIColor.wnsLightGrey
        mainView.layer.cornerRadius = 16.0
        mainView.layer.masksToBounds = true

        var i = 0
        for item in items {
            let view = ChooseSubview(item: item, tag: i)
            view.delegate = self
            viewsArray.append(view)
            i += 1
        }

        let stackView = createStackView(.vertical, .fill, .fill, 0, with: viewsArray)
        mainView.addSubview(stackView.prepareForAutoLayout())
        stackView.pinEdgesToSuperviewEdges()
    }
}

// MARK: - ChooseSubviewDelegate

extension ChooseListView: ChooseSubviewDelegate {
    func selectItem(_ isSelect: Bool, tag: Int) {
        for i in 0..<items.count {
            viewsArray[i].setSelected(tag == i)
            items[i].isSelect = tag == i
        }
        if isSelect {
            delegate?.setItem(tag)
        }
    }
}
