//
// Created by Danila Lyahomskiy on 24/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import Lottie

class StartViewController: ParentViewController {

    var output: StartViewOutput!

    fileprivate let chooseCity = ChooseView(title: L10n.startTitleChooseCity)

    fileprivate let chooseLanguage = ChooseView(title: L10n.startTitleChooseLanguage)

    fileprivate var languageArray = [ChooseListItem(image: Asset.Winstrike.russia.image, title: L10n.startTitleChooseRussian, isSelect: false),
    ChooseListItem(image: Asset.Winstrike.england.image, title: L10n.startTitleChooseEnglish, isSelect: false)]

    lazy var chooseListView = ChooseListView(items: languageArray)

    fileprivate let buttonView = UIView()

    fileprivate let arrayCity = ["Москва",
                     "Санкт-Петербург",
                     "Нижний Новгород",
                     "Саранск",
                     "Пятигорск",
                     "Кинежма",
                     "Хабаровск",
                     "Тяньгушево"]

    fileprivate var chooseListTableView = ChooseListTableView()

    fileprivate var selectedCityIndex: Int?
    fileprivate var selectedLangTitle: Int?

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        changeStatusBar(isWhite: true)

        addSubView()
    }

    private func addSubView() {

        chooseLanguage.delegate = self

        var inset: CGFloat = 66

        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, appDelegate.sizeOfScreen == .iphone5s {
            inset = 24
        }

        chooseCity.delegate = self
        chooseCity.tag = 1

        chooseListView.delegate = self
        chooseListView.isHidden = true

        chooseListTableView.delegate = self
        chooseListTableView.isHidden = true

        let arrayItemOfCity = arrayCity.map { ChooseListItem(image: nil, title: $0, isSelect: false) }
        chooseListTableView.setData(items: arrayItemOfCity)

        let button = UIButton()
        button.heightAnchor ~= 48
        buttonView.addSubview(button.prepareForAutoLayout())
        buttonView.isHidden = false
        button.pinEdgesToSuperviewEdges(top: 20, left: 42, right: 42, bottom: 0)

        let stackView = createStackView(.vertical, .fill, .fill, 12, with: [
            chooseLanguage,
            chooseListView,
            chooseCity,
            chooseListTableView,
            buttonView]
        )
        view.addSubview(stackView.prepareForAutoLayout())
        stackView.topAnchor ~= view.centerYAnchor - 68
        stackView.leadingAnchor ~= view.leadingAnchor + inset
        stackView.trailingAnchor ~= view.trailingAnchor - inset

        buttonView.layoutSubviews()
        buttonView.layoutIfNeeded()
        button.configureGradientButton(title: L10n.startNextButtonTitle)
        button.addTarget(self, action: #selector(nextButtonHandlerTap), for: .touchUpInside)

        let logoImage = UIImageView(image: Asset.Winstrike.label.image)
        view.addSubview(logoImage.prepareForAutoLayout())
        logoImage.centerXAnchor ~= view.centerXAnchor
        logoImage.bottomAnchor ~= stackView.topAnchor - 96

        let animationView = LOTAnimationView(name: "data2")
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        view.addSubview(animationView.prepareForAutoLayout())
        animationView.pinEdgesToSuperviewEdges()
        animationView.play()
        view.sendSubview(toBack: animationView)
    }

    @objc func nextButtonHandlerTap() {
        output.nextButtonTap()
    }
}

// MARK: - StartViewInput
extension StartViewController: StartViewInput {

    func setupInitialState() {

    }
}

// MARK: - ChooseViewDelegate
extension StartViewController: ChooseViewDelegate {

    func changeStatus(_ isOpen: Bool, tag: Int) {
        buttonView.isHidden = isOpen
        if tag == 0 {
            chooseListView.isHidden = !isOpen
            chooseListTableView.isHidden = true
            chooseCity.isHidden = isOpen
            chooseCity.close()
        } else {
            chooseListTableView.isHidden = !isOpen
            chooseListView.isHidden = true
            chooseLanguage.isHidden = isOpen
            chooseLanguage.close()
        }
    }
}

// MARK: - ChooseListViewDelegate
extension StartViewController: ChooseListViewDelegate {
    func setItem(_ index: Int) {
        selectedLangTitle = index
        if selectedCityIndex != nil && buttonView.isHidden {
            buttonView.isHidden = false
        }
        chooseLanguage.setData(image: languageArray[index].image, text: languageArray[index].title)
        chooseListView.isHidden = true
        chooseCity.isHidden = false
    }
}

// MARK: - ChooseListViewDelegate
extension StartViewController: ChooseListTableViewDelegate {
    func selectItem(_ index: Int) {
        selectedCityIndex = index
        if selectedLangTitle != nil && buttonView.isHidden {
            buttonView.isHidden = false
        }
        chooseCity.setData(image: Asset.Winstrike.maps.image, text: arrayCity[index])
        chooseListTableView.isHidden = true
        chooseLanguage.isHidden = false
    }
}
