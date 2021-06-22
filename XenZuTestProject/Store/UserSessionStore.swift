//
//  UserSessionStore.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import Foundation

class UserSessionStore: ObservableObject {
    static let userSession: UserSession = UserSession(accessToken: AccessToken.apiKey)
}
