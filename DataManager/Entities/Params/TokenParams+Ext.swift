//
//  TokenParams.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-26.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import Utility

public class TokenParams: Parameters {
    var token = defaultString
    var firebaseToken = defaultString

    public init() {
    }

    public init(_ token: String = defaultString, _ firebaseToken: String = defaultString) {
        self.token = token
        self.firebaseToken = firebaseToken
    }

    public func toDict() -> [String: Any] {
        return ["token": token,
                "firebase_token": firebaseToken]
    }
}

public typealias TokenP = TokenParams