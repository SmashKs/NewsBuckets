//
//  TokenObj.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-27.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import RealmSwift
import Utility

public class TokenObj: Object {
    @objc dynamic var token = defaultString
    @objc dynamic var firebaseToken = defaultString
}