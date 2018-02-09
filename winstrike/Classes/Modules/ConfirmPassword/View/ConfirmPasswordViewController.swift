//
// Created by Danila Lyahomskiy on 07/02/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit

class ConfirmPasswordViewController: ParentViewController {

    var output: ConfirmPasswordViewOutput!

    let contentView = UIView()

    private var topViewConstraint: NSLayoutConstraint?
    private var screenSize: SizeScreen!
    let phoneNumber: String

    // MARK: - Life cycle

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }

//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        // swiftlint:disable:next force_unwrapping
        screenSize = ((UIApplication.shared.delegate as? AppDelegate)?.sizeOfScreen)!

        changeStatusBar(isWhite: true)
        addSubView()
        //addBottomSubView()
    }

    // MARK: - Views

    func addSubView() {
        view.addSubview(contentView.prepareForAutoLayout())
        contentView.pinEdgesToSuperviewEdges(excluding: .top)
        topViewConstraint = contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        topViewConstraint?.isActive = true

        let topImageView = HeaderImageView()
        topImageView.type = .lock
        contentView.addSubview(topImageView.prepareForAutoLayout())
        topImageView.centerXAnchor ~= contentView.centerXAnchor
        topImageView.heightAnchor ~= 87
        topImageView.widthAnchor ~= contentView.widthAnchor

        let codeSentLabel = UILabel()
        contentView.addSubview(codeSentLabel.prepareForAutoLayout())
        codeSentLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsGrey, text: L10n.confirmPasswordCodeSent)
        codeSentLabel.topAnchor ~= topImageView.bottomAnchor + 54
        codeSentLabel.leadingAnchor ~= contentView.leadingAnchor + 40

        let codeSentMessageLabel = UILabel()
        contentView.addSubview(codeSentMessageLabel.prepareForAutoLayout())
//        codeSentMessageLabel.configureLabel(font: UIFont.wnsStemRegular(size: 15), textColor: UIColor.wnsLightGrey, text: <#T##String#>)
    }
}

// MARK: - ConfirmPasswordViewInput

extension ConfirmPasswordViewController: ConfirmPasswordViewInput {

    func setupInitialState() {

    }
}
