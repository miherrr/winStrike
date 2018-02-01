//
// Created by Xander on 30.07.17.
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import UIKit

extension UIFont {

    class func wnsSystemRegular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }

    class func wnsSystemMedium(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }

    class func wnsStemMedium(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Stem-Medium", size: size) else {
            fatalError("Stem-Medium font not found")
        }
        return font
    }

    class func wnsStemRegular(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Stem-Regular", size: size) else {
            fatalError("Stem-Regular font not found")
        }
        return font
    }

    class func wnsStemLight(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Stem-Light", size: size) else {
            fatalError("Stem-Light font not found")
        }
        return font
    }

    class func wnsStemBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Stem-Bold", size: size) else {
            fatalError("Stem-Bold font not found")
        }
        return font
    }
}
