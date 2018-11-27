//
//  KeywordObj.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-27.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import RealmSwift
import Utility

public class KeywordObj: Object {
    @objc dynamic var keyword = defaultString

    public override class func primaryKey() -> String? {
        return "keyword"
    }
}