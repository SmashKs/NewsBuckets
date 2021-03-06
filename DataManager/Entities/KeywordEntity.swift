//
//  KeywordEntity.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-27.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

public class KeywordEntity {
    public var keyword: String? = nil

    init(_ keyword: String?) {
        self.keyword = keyword
    }
}

public typealias Keyword = KeywordEntity
