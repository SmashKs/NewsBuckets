//
//  DataRepository.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

public class DataRepository: Repository {
    private var local: DataStore!
    private var remote: DataStore!

    public init(local localStore: DataStore, remote remoteStore: DataStore) {
        local = localStore
        remote = remoteStore
    }

    public func get(newses parameters: [String: Any]) -> Completable {
        return remote.fetch(newses: parameters)
    }

    public func add(subscriber parameters: [String: String]) -> Completable {
        return remote.new(subscriber: parameters)
    }

    public func update(keyword parameters: [String: String]) -> Completable {
        return remote.modify(keyword: parameters)
    }

    public func getFakeList() -> Single<FakeEntity> {
        return remote.fetchFakeList()
    }

    public func keep(info entity: Info?) -> Completable {
        return local.persist(info: entity)
    }
}
