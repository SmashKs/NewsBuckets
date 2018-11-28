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
    private var localMMKV: LocalDataService!

    public init(realm: LocalDataService, mmkv: LocalDataService) {
        localRealm = realm
        localMMKV = mmkv
    }

    public func fetch(newses parameters: [String: Any]) -> Completable {
        fatalError("fetch(newses:) has not been implemented")
    }

    public func new(subscriber parameters: Parameters?) -> Single<Token> {
        fatalError("new(subscriber:) has not been implemented")
    }

    public func modify(keyword parameters: Parameters?) -> Single<Token> {
        fatalError("modify(keyword:) has not been implemented")
    }

    public func fetchNewsToken() -> Single<Token> {
        return localMMKV.retrieveNewsToken()
    }

    public func fetchNewsKeywords() -> Single<[Keyword]> {
        return localRealm.retrieveNewsKeywords()
    }

    public func new(keyword parameters: Parameters?) -> Completable {
        let key = KeywordObj()

        if let params = parameters?.toDict(),
           let keyword = params["keywords"] as? String {
            key.keyword = keyword
        }

        return localRealm.create(keyword: key)
    }

    public func remove(keyword parameters: Parameters?) -> Completable {
        let key = KeywordObj()

        if let params = parameters?.toDict(),
           let keyword = params["keywords"] as? String {
            key.keyword = keyword
        }

        return localRealm.release(keyword: key)
    }

    public func modify(token parameters: Parameters?) -> Completable {
        let obj = TokenObj()

        if let param = parameters?.toDict(),
           let token = param["token"] as? String,
           let firebaseToken = param["token"] as? String {
            obj.token = token
            obj.firebaseToken = firebaseToken
        }

        return localMMKV.replace(token: obj)
    }

    public func persist(token parameters: Parameters?) -> Completable {
        let obj = TokenObj()

        if let param = parameters?.toDict(),
           let token = param["token"] as? String,
           let firebaseToken = param["token"] as? String {
            obj.token = token
            obj.firebaseToken = firebaseToken
        }

        return localMMKV.replace(token: obj)
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return localRealm.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        return localRealm.replace(info: entity!)
    }
}
