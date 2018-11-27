//
//  NewsLocal+MMKV.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-27.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import RxSwift
import MMKV

public class NewsMMKV: LocalDataService {
    private var mmkv: MMKV

    public init(_ mmkv: MMKV) {
        self.mmkv = mmkv
    }

    public func retrieveNewsToken() -> Single<Token> {
        fatalError("retrieveNewsToken() has not been implemented")
    }

    public func replace(token object: TokenObj) -> Completable {
        fatalError("replace(token:) has not been implemented")
    }

    public func create(token object: TokenObj) -> Completable {
        fatalError("create(token:) has not been implemented")
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        fatalError("retrieveFakeList() has not been implemented")
    }

    public func update(info entity: Info) -> Completable {
        fatalError("update(info:) has not been implemented")
    }

    public func remove(info entity: Info?) -> Completable {
        fatalError("remove(info:) has not been implemented")
    }
}