//
// Created by Danila Lyahomskiy on 23/01/2018.
// Copyright (c) 2018 PRSolution. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: ParentViewController {

    var output: SplashViewOutput!

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

        let animationView = LOTAnimationView(name: "data")
        animationView.contentMode = .scaleAspectFill
        self.view.addSubview(animationView.prepareForAutoLayout())
        animationView.pinEdgesToSuperviewEdges()
        animationView.play { _ in
            self.output.finishAnimation()
        }
    }
}

// MARK: - SplashViewInput

extension SplashViewController: SplashViewInput {

    func setupInitialState() {

    }
}
