//
//  Enums.swift
//  winstrike
//
//  Created by iOS on 01.02.2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit

enum Social: Int {
    case vkontakte
    case facebook
    case twitter
    case steam
    func socilaImage() -> UIImage {
        switch self {
        case .vkontakte:
            return Asset.Winstrike.vk.image
        case .facebook:
            return Asset.Winstrike.facebook.image
        case .twitter:
            return Asset.Winstrike.twitch.image
        case .steam:
            return Asset.Winstrike.steam.image
        }
    }
}
