//
// Created by Danila Lyahomskiy on 01/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class HelperViewController: ParentViewController {

    var output: HelperViewOutput!

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changeStatusBar(isWhite: false)
//        setNeedsStatusBarAppearanceUpdate()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeStatusBar(isWhite: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        changeStatusBar(isWhite: false)
        titleViewLabel.text = L10n.helperTitleText

        let backButton = UIButton()
        backButton.setImage(Asset.Winstrike.backChevron.image, for: .normal)
        backButton.addTarget(self, action: #selector(backHandlerTap), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -9, bottom: 0, right: 0)
        var frame = backButton.frame
        frame.size = CGSize(width: 30, height: 100)
        backButton.frame = frame
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        addSubviews()
    }

    private func addSubviews() {

        let titleAccess = UILabel()
        titleAccess.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helperAccessAccount)
        view.addSubview(titleAccess.prepareForAutoLayout())
        titleAccess.leadingAnchor ~= view.leadingAnchor + 24
        titleAccess.topAnchor ~= view.topAnchor + 24

        let sendSms = UIView()
        sendSms.configure(image: Asset.Help.phone.image, title: L10n.helperSendSms)
        view.addSubview(sendSms.prepareForAutoLayout())
        sendSms.topAnchor ~= titleAccess.bottomAnchor + 24
        sendSms.leadingAnchor ~= view.leadingAnchor
        sendSms.trailingAnchor ~= view.trailingAnchor
        let sendSmsTap = UITapGestureRecognizer(target: self, action: #selector(sendSmsHandlerTap))
        sendSms.addGestureRecognizer(sendSmsTap)

        let sendMail = UIView()
        sendMail.configure(image: Asset.Help.mail.image, title: L10n.helperSendMail)
        view.addSubview(sendMail.prepareForAutoLayout())
        sendMail.topAnchor ~= sendSms.bottomAnchor + 24
        sendMail.leadingAnchor ~= view.leadingAnchor
        sendMail.trailingAnchor ~= view.trailingAnchor
        let sendMailTap = UITapGestureRecognizer(target: self, action: #selector(sendMailHandlerTap))
        sendMail.addGestureRecognizer(sendMailTap)

        let helpCenterTitle = UILabel()
        helpCenterTitle.configureLabel(font: UIFont.wnsStemMedium(size: 17), textColor: UIColor.wnsHelperColor, text: L10n.helperHelpCenter)
        view.addSubview(helpCenterTitle.prepareForAutoLayout())
        helpCenterTitle.leadingAnchor ~= view.leadingAnchor + 24
        helpCenterTitle.topAnchor ~= sendMail.bottomAnchor + 31

        let helpCenter = UIView()
        helpCenter.configure(image: Asset.Help.book.image, title: L10n.helperHelpCenterWinStrike)
        view.addSubview(helpCenter.prepareForAutoLayout())
        helpCenter.topAnchor ~= helpCenterTitle.bottomAnchor + 24
        helpCenter.leadingAnchor ~= view.leadingAnchor
        helpCenter.trailingAnchor ~= view.trailingAnchor
        let helpCenterTap = UITapGestureRecognizer(target: self, action: #selector(helpCenterHandlerTap))
        helpCenter.addGestureRecognizer(helpCenterTap)
    }

    // MARK: - Actions

    @objc func backHandlerTap() {
        output.backTap()
    }

    @objc func sendSmsHandlerTap() {
        output.helpPhoneTap()
    }

    @objc func sendMailHandlerTap() {
        output.helpMailTap()
    }

    @objc func helpCenterHandlerTap() {
        print("helpCenterHandlerTap")
    }
}

// MARK: - HelperViewInput

extension HelperViewController: HelperViewInput {

    func setupInitialState() {

    }
}

private extension UIView {
    func configure(image: UIImage, title: String) {

        heightAnchor ~= 25

        let imageView = UIImageView()
        imageView.image = image
        imageView.heightAnchor ~= 25
        imageView.widthAnchor ~= 25
        imageView.contentMode = .center

        addSubview(imageView.prepareForAutoLayout())
        imageView.leadingAnchor ~= leadingAnchor + 48
        imageView.centerYAnchor ~= centerYAnchor

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.wnsStemRegular(size: 15)
        titleLabel.textColor = UIColor.wnsHelperColor

        addSubview(titleLabel.prepareForAutoLayout())
        titleLabel.centerYAnchor ~= centerYAnchor
        titleLabel.leadingAnchor ~= imageView.trailingAnchor + 24
    }
}
