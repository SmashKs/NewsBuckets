//
//  TokenParams.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-26.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import Utility

public class KeywordParams: TokenParams {
    var keywords = defaultString

    public init(_ token: String, _ firebaseToken: String, _ keywords: String) {
        super.init(token, firebaseToken)
        self.keywords = keywords
    }

    public override func toDict() -> [String: Any] {
        var parent = super.toDict()

        parent["keywords"] = keywords

        return parent
    }
}

public typealias KeywordP = KeywordParams
