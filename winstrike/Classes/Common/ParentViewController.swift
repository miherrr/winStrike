//
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    let titleViewLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 240, height: 44))
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    let activityVC = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.titleView = titleViewLabel
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarView?.backgroundColor = .black
        UIApplication.shared.statusBarView?.isHidden = true

        view.addSubview(activityVC.prepareForAutoLayout())
        activityVC.centerXAnchor ~= view.centerXAnchor
        activityVC.centerYAnchor ~= view.centerYAnchor
        activityVC.activityIndicatorViewStyle = .whiteLarge
        //activityVC.color = UIColor.cnmGreyDark

        activityVC.isHidden = true

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let statusBarAlertManager = StatusBarAlertManager.sharedInstance
        statusBarAlertManager.unregistrate(viewController: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)

        let statusBarAlertManager = StatusBarAlertManager.sharedInstance
        statusBarAlertManager.registrate(viewController: self)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func showAlert(message: String) {

        let statusBarAlertManager = StatusBarAlertManager.sharedInstance
        statusBarAlertManager.setStatusBarAlert(with: message, with: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            statusBarAlertManager.clear()
        }
    }

    func showMessage(message: String) {

        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)

        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)

        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    func changeStatusBar(isWhite: Bool) {
        UIApplication.shared.statusBarView?.backgroundColor = isWhite ? .white : .black
        UIApplication.shared.statusBarStyle = isWhite ? .default : .lightContent
        UIApplication.shared.statusBarView?.isHidden = false
        UINavigationBar.appearance().backgroundColor = isWhite ? .white : .black
        navigationController?.navigationBar.isTranslucent = isWhite
        navigationController?.navigationBar.isHidden = isWhite
        //UINavigationBar.appearance().barStyle = .black
    }
}

private extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
