//
// Created by mkdk on 08/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HomeViewController: ParentViewController {
    var output: HomeViewOutput!
    var homeData: [HomeTableData] = [HomeTableData]()

    var tableView: UITableView! = {
        let table = UITableView()
        table.isEditing = false
        table.allowsSelection = false
        return table
    }()
    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    func imageWithImage (image: UIImage, scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        // swiftlint:disable:next force_unwrapping
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    var stackContainer: UIView! = {
        let view = UIView()
//        view.backgroundColor = .white
        return view
    }()

    var stack: UIStackView! = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        return s
    }()

    var homemButton: UIButton! = {
        let b = UIButton()
        b.setImage(Asset.HomeScreen.homeMessage.image, for: .normal)
        return b
    }()

    var moneyButton: UIButton! = {
        let b = UIButton()
        b.setImage(Asset.HomeScreen.moneyHand.image, for: .normal)
        return b
    }()

    var listButton: UIButton! = {
        let b = UIButton()
        b.setImage(Asset.HomeScreen.moneyHand.image, for: .normal)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBar(isWhite: false)

        titleViewLabel.text = "Москва"

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.homeMenu.image, for: .normal)
        backButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: true)

        let profileButton = UIButton()
        let avatar = imageWithImage(image: Asset.Winstrike.profileDumb.image, scaledToSize: CGSize(width: 30, height: 30))
        profileButton.setImage(avatar, for: .normal)
        var tmpframe = profileButton.frame
        tmpframe.size = CGSize(width: 30, height: 30)
        profileButton.frame = tmpframe
        profileButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        let profileItem = UIBarButtonItem(customView: profileButton)
        self.navigationItem.setRightBarButton(profileItem, animated: true)
        tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)

        view.addSubview(stackContainer.prepareForAutoLayout())
        stackContainer.pinEdgesToSuperviewEdges(excluding: .top)
        stackContainer.heightAnchor ~= 55

        stackContainer.addSubview(stack.prepareForAutoLayout())
        stack.pinToSuperview([.top, .bottom])
        stack.leadingAnchor ~= stackContainer.leadingAnchor + 50
        stack.trailingAnchor ~= stackContainer.trailingAnchor - 50
        stack.addArrangedSubview(homemButton)
        stack.addArrangedSubview(moneyButton)
        stack.addArrangedSubview(listButton)

        view.addSubview(tableView.prepareForAutoLayout())
        tableView.pinEdgesToSuperviewEdges(excluding: .bottom)
        tableView.bottomAnchor ~= stackContainer.topAnchor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: "homeTableCell")

        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBar(isWhite: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeStatusBar(isWhite: false)
    }

    @objc func homeButtonAction(_ sender: Any) {
        print("home action")
    }

}

// MARK: - HomeViewInput

extension HomeViewController: HomeViewInput {

    func setupInitialState() {

    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableCell") as! HomeViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
