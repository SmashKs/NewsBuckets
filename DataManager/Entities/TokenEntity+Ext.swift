//
//  TokenEntity+Ext.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/11/27.
//  Copyright © 2018 SmashKs All rights reserved.
//

import EVReflection

public class TokenEntity: EVObject {
    var token: String? = nil
    var firebaseToken: String? = nil
}

extension TokenEntity: Entity {
    static let token = "token"
    static let firebaseToken = "firebase_token"
}

public typealias Token = TokenEntity
