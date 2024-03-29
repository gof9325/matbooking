//
//  User.swift
//  matbooking
//
//  Created by 황경원 on 2022/10/03.
//

import Foundation
import JWTDecode

struct Auth0User {
    let id: String
    let email: String
    let picture: String
}

extension Auth0User {
    init?(from idToken: String) {
        guard let jwt = try? decode(jwt: idToken),
              let id = jwt.subject,
              let email = jwt["email"].string,
              let picture = jwt["picture"].string
        else { return nil }
        self.id = id
        self.email = email
        self.picture = picture
    }
}
