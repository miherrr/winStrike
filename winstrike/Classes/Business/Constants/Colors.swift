//
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit

extension UIColor {

    class var wnsLightGrey: UIColor {
        return UIColor(white: 242.0 / 255.0, alpha: 1.0)
    }

    class var wnsGrey: UIColor {
        return UIColor(white: 155.0 / 255.0, alpha: 1.0)
    }

    class var wnsPink: UIColor {
        return UIColor(red: 201.0 / 255.0, green: 24.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }

    class var wnsBlackFont: UIColor {
        return UIColor(white: 22.0 / 255.0, alpha: 1.0)
    }

    class var wnsHelperColor: UIColor {
        return UIColor(white: 31.0 / 255.0, alpha: 1.0)
    }

    class var wnsRightGradientColor: UIColor {
        return UIColor(red: 114.0 / 255.0, green: 40.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
    }

    class var wnsLeftGradientColor: UIColor {
        return UIColor(red: 224.0 / 255.0, green: 43.0 / 255.0, blue: 126.0 / 255.0, alpha: 1.0)
    }

    class var wnsTextFieldPlderColor: UIColor {
        return UIColor(white: 16.0 / 255.0, alpha: 0.5)
    }

    class var wnsTextFieldColor: UIColor {
        return UIColor(white: 16.0 / 255.0, alpha: 1.0)
    }

    class func setColorGray(white: CGFloat, alpha: CGFloat = 1) -> UIColor {
         return UIColor(white: white / 255.0, alpha: alpha)
    }
}
