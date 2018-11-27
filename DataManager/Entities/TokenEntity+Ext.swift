//
//  TokenEntity+Ext.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/11/27.
//  Copyright © 2018 SmashKs All rights reserved.
//

import EVReflection
import Utility

public class TokenEntity: EVObject {
    public var token = defaultString
    public var firebaseToken = defaultString
}

extension TokenEntity: Entity {
    static let token = "token"
    static let firebaseToken = "firebase_token"
}

public typealias Token = TokenEntity
