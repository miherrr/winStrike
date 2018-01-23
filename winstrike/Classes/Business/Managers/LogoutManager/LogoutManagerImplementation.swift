//
//  LogoutManagerImplementation.swift
//  cinema
//
//  Created by incetro on 29/08/2017.
//  Copyright © 2017 Heads and Hands. All rights reserved.
//

import Foundation

// MARK: - LogoutManagerImplementation

class LogoutManagerImplementation {

    let authTokenManager: AuthTokenManagerProtocol

    init(authTokenManager: AuthTokenManagerProtocol) {

        self.authTokenManager = authTokenManager
    }
}

// MARK: - LogoutManager

extension LogoutManagerImplementation: LogoutManager {

    func clearData() {

        authTokenManager.removeApiToken()
    }
}
