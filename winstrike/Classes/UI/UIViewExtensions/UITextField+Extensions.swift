//
//  UITextField+Extensions.swift
//  winstrike
//
//  Created by PRS on 13/02/2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

extension UITextField {
    func validateEmail() -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return text?.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
