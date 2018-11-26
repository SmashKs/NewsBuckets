//
//  LocalDataStore.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

public class LocalDataStore: DataStore {
    private var localRealm: LocalDataService!

    public init(realm: LocalDataService) {
        localRealm = realm
    }

    public func fetch(newses parameters: [String: Any]) -> Completable {
        fatalError("fetch(newses:) has not been implemented")
    }

    public func new(subscriber parameters: [String: String]) -> Completable {
        fatalError("new(subscriber:) has not been implemented")
    }

    public func modify(keyword parameters: [String: String]) -> Completable {
        fatalError("modify(keyword:) has not been implemented")
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return localRealm.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        return localRealm.update(info: entity!)
    }
}
