//
//  TokenParams.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-26.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

public class TokenParams: Parameters {
    var token: String?
    var firebaseToken: String?

    public init() {
    }

    public func toDict() -> [String: Any] {
        return ["token": token!,
                "firebase_token": firebaseToken!]
    }
}