//
//  ChooseListTableView.swift
//  winstrike
//
//  Created by iOS on 29.01.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

protocol ChooseListTableViewDelegate: class {
    func selectItem(_ index: Int)
}

class ChooseListTableView: UIView {

    weak var delegate: ChooseListTableViewDelegate?

    fileprivate var items: [ChooseListItem] = []

    let tableView = UITableView()

    required init(coder _: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(frame: .zero)

        backgroundColor = UIColor.wnsLightGrey
        layer.cornerRadius = 16

        addSubview(tableView.prepareForAutoLayout())
        tableView.pinEdgesToSuperviewEdges(top: 16, left: 0, right: 24, bottom: 16)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityCell.self, forCellReuseIdentifier: CityCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }

    // MARK: - Public function

    func setData(items: [ChooseListItem]) {
        self.items = items
        let height = items.count < 3 ? items.count * 34 + 32 : 3 * 34 + 32
        heightAnchor ~= CGFloat(height)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ChooseListTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.reuseIdentifier, for: indexPath)
        if let cityCel = cell as? CityCell {
            cityCel.title = items[indexPath.row].title
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       delegate?.selectItem(indexPath.row)
    }
}

// MARK: - UITableViewDelegate

extension ChooseListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 34
    }
}

// MARK: - UIScrollViewDelegate

extension ChooseListTableView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let indicator = self.tableView.subviews.last as? UIImageView {
            indicator.image = Asset.Winstrike.rectangle.image
            indicator.contentMode = .center
        }
    }
}
