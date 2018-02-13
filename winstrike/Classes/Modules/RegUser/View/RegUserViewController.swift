//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import SwipeMenuViewController

class RegUserViewController: ParentViewController {

    var output: RegUserViewOutput!

    let contentView = UIView()
    let phoneTextField = PhoneNumberView()
    let emailTextField = UIRoundedTextField()
    let phoneNextButton = UIButton()
    let emailNextButton = UIButton()
    var swipeMenuView: SwipeMenuView!
    var bottomLabel: UILabelHref!
    let topImageView = HeaderImageView()

    private var topViewConstraint: NSLayoutConstraint?
    private var screenSize: SizeScreen!

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTapOutsideToHideKeyboard()
        output.viewIsReady()

        // swiftlint:disable:next force_unwrapping
        screenSize = ((UIApplication.shared.delegate as? AppDelegate)?.sizeOfScreen)!

        changeStatusBar(isWhite: true)
        addSubView()
        addBottomSubView()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    // MARK: - Views

    func addSubView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        topImageView.type = .phone
        contentView.addSubview(topImageView.prepareForAutoLayout())
        topImageView.centerXAnchor ~= contentView.centerXAnchor
        topImageView.topAnchor ~= contentView.topAnchor + 71
        topImageView.heightAnchor ~= 87
        topImageView.widthAnchor ~= contentView.widthAnchor

        swipeMenuView = SwipeMenuView(frame: .zero)
        swipeMenuView.layoutIfNeeded()

        contentView.addSubview(swipeMenuView.prepareForAutoLayout())
        swipeMenuView.topAnchor ~= topImageView.bottomAnchor + 54
        swipeMenuView.leadingAnchor ~= contentView.leadingAnchor
        swipeMenuView.trailingAnchor ~= contentView.trailingAnchor
        swipeMenuView.bottomAnchor ~= contentView.bottomAnchor

        swipeMenuView.dataSource = self
        swipeMenuView.delegate = self
        swipeMenuView.layoutIfNeeded()
        var options: SwipeMenuViewOptions = .init()
        options.tabView.itemView.font = UIFont.wnsStemRegular(size: 20)
        options.tabView.itemView.textColor = UIColor.wnsGrey
        options.tabView.underlineView.backgroundColor = UIColor.wnsPink
        options.tabView.style = .segmented
        swipeMenuView.reloadData(options: options)
    }

    func getPhoneMethodView() -> UIViewController {
        let content = UIViewController()
        let phoneHintLabel = UILabel()

        content.view.addSubview(phoneHintLabel.prepareForAutoLayout())
        phoneHintLabel.topAnchor ~= content.view.topAnchor + 71
        phoneHintLabel.leadingAnchor ~= content.view.leadingAnchor + 40
        phoneHintLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: L10n.regUserPhoneHint)

        content.view.addSubview(phoneTextField.prepareForAutoLayout())
        phoneTextField.topAnchor ~= phoneHintLabel.bottomAnchor + 16
        phoneTextField.widthAnchor ~= 288
        phoneTextField.centerXAnchor ~= content.view.centerXAnchor
        phoneTextField.heightAnchor ~= 48
        phoneTextField.delegate = self

        content.view.addSubview(phoneNextButton.prepareForAutoLayout())
        phoneNextButton.topAnchor ~= phoneTextField.bottomAnchor + (screenSize == .iphone5s ? 40 : 100)
        phoneNextButton.centerXAnchor ~= content.view.centerXAnchor
        phoneNextButton.widthAnchor ~= 160
        phoneNextButton.heightAnchor ~= 48
        phoneNextButton.alpha = 0.5
        phoneNextButton.layoutIfNeeded()
        phoneNextButton.configureGradientButton(title: L10n.regUserNextButton)
        phoneNextButton.addTarget(self, action: #selector(phoneNextButtonTap), for: .touchUpInside)

        return content
    }

    func getEmailMethodView() -> UIViewController {
        let content = UIViewController()
        let emailHintLabel = UILabel()

        content.view.addSubview(emailHintLabel.prepareForAutoLayout())
        emailHintLabel.topAnchor ~= content.view.topAnchor + 71
        emailHintLabel.leadingAnchor ~= content.view.leadingAnchor + 40
        emailHintLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: L10n.regUserEmailHint)

        content.view.addSubview(emailTextField.prepareForAutoLayout())
        emailTextField.configure(placeholder: L10n.regUserEmailPlaceholder, keyboardType: .emailAddress)
        emailTextField.topAnchor ~= emailHintLabel.bottomAnchor + 16
        emailTextField.widthAnchor ~= 288
        emailTextField.centerXAnchor ~= content.view.centerXAnchor
        emailTextField.heightAnchor ~= 48
        emailTextField.delegate = self

        content.view.addSubview(emailNextButton.prepareForAutoLayout())
        emailNextButton.topAnchor ~= emailTextField.bottomAnchor + (screenSize == .iphone5s ? 40 : 100)
        emailNextButton.centerXAnchor ~= content.view.centerXAnchor
        emailNextButton.widthAnchor ~= 160
        emailNextButton.heightAnchor ~= 48
        emailNextButton.alpha = 0.5
        emailNextButton.layoutIfNeeded()
        emailNextButton.configureGradientButton(title: L10n.regUserNextButton)
        emailNextButton.addTarget(self, action: #selector(emailNextButtonTap), for: .touchUpInside)

        return content
    }

    func addBottomSubView() {
        let stringsArray = [
            (nil, L10n.parentHaveAccount),
            (enterAccountTap, L10n.parentEnterAccount)
        ]

        bottomLabel = UILabelHref(stringsArray: stringsArray)
        contentView.addSubview(bottomLabel.prepareForAutoLayout())

        bottomLabel.bottomAnchor ~= contentView.bottomAnchor - 15
        bottomLabel.centerXAnchor ~= contentView.centerXAnchor
        bottomLabel.widthAnchor ~= contentView.widthAnchor
    }

    // MARK: - Actions

    @objc
    func phoneNextButtonTap() {
        if phoneTextField.validate() {
            print("phone number is valid")
            output?.phoneNextButtonTap(phoneNumber: phoneTextField.phoneNumber)
        } else {
            print ("phone number is invalid")
        }
    }

    @objc
    func emailNextButtonTap() {
        if phoneTextField.validate() {
            print("phone number is valid")
            output?.emailNextButtonTap()
        } else {
            print ("phone number is invalid")
        }
    }

    @objc
    func enterAccountTap() {
        output?.existingAccountTap()
    }
}

// MARK: - SwipeMenuViewDelegate
extension RegUserViewController: SwipeMenuViewDelegate {
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        //topViewConstraint?.constant = 0

        var nextIcon: BigIcons
        if toIndex == 0 {
            nextIcon = .phone
        } else if toIndex == 1 {
            nextIcon = .message
        } else {
            fatalError("not implemented")
        }

        UIView.transition(
            with: topImageView,
            duration: 0.4,
            options: .transitionCrossDissolve,
            animations: { self.topImageView.type = nextIcon },
            completion: nil
        )
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.view.endEditing(true)
        }
    }
}

// MARK: - SwipeMenuViewDataSource
extension RegUserViewController: SwipeMenuViewDataSource {
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        if index == 0 {
            return getPhoneMethodView()
        } else if index == 1 {
            return getEmailMethodView()
        } else {
            fatalError("not implemented")
        }
    }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        if index == 0 {
            return L10n.regUserTabPhone
        } else if index == 1 {
            return L10n.regUserTabEmail
        } else {
            fatalError("not implemented")
        }
    }

    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return 2
    }
}

// MARK: - UITextFieldDelegate
extension RegUserViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //если экран уже смещен, то не меняем смещение. Это надо для того, чтобы не слетала анимация переключения между вкладками
        view.layoutSubviews()
        view.layoutIfNeeded()

        var offset = CGFloat()

        if true {
            if screenSize == .iphone5s {
                offset = -250
            } else if screenSize == .iphoneX {
                offset = -20
            } else {
                let distBetweenConfirmBtnAndBottom = (swipeMenuView.contentScrollView?.frame.size.height ?? 0) -
                    emailNextButton.frame.origin.y -
                    emailNextButton.frame.size.height

                offset = -(20 - (distBetweenConfirmBtnAndBottom - 253))
            }
        }

        topViewConstraint?.constant = offset
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        topViewConstraint?.constant = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTextField {
            emailNextButton.alpha = emailTextField.validateEmail() ? 1.0 : 0.5
        } else {
            phoneNextButton.alpha = phoneTextField.validate() ? 1.0 : 0.5
        }
        return true
    }
}

// MARK: - RegUserViewInput

extension RegUserViewController: RegUserViewInput {

    func setupInitialState() {

    }
}
