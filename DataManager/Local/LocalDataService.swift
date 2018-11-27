//
//  LocalDatabase.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

public protocol LocalDataService {
    func retrieveNewsToken() -> Single<Token>

    func replace(token object: TokenObj) -> Completable

    func create(token object: TokenObj) -> Completable

    func retrieveFakeList() -> Single<FakeEntity>

    func update(info entity: Info) -> Completable

    func remove(info entity: Info?) -> Completable
}
