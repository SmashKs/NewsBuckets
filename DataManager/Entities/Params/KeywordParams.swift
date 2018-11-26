//
//  TokenParams.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-26.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

public class keywordParams: TokenParams {
    var keywords: String?

    public override init() {
        super.init()
    }

    public override func toDict() -> [String: Any] {
        var parent = super.toDict()

        parent["keywords"] = keywords

        return parent
    }
}