//
//  RemoteDataStore.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

public class RemoteDataStore: DataStore {
    private var moyaService: RemoteDataService!

    public init(moya service: RemoteDataService) {
        self.moyaService = service
    }

    public func fetch(newses parameters: [String: Any]) -> Completable {
//        return moyaService.retrieveFakeList()
        fatalError("fetch(info:) has not been implemented")
    }

    public func new(subscriber parameters: Parameters?) -> Single<Token> {
        guard let params = parameters?.toDict() else {
            fatalError("There's no parameter")
        }
        return moyaService.createSubscriber(parameters: params)
    }

    public func modify(keyword parameters: Parameters?) -> Single<Token> {
        guard let params = parameters?.toDict() else {
            fatalError("There's no parameter")
        }
        return moyaService.replaceKeywords(parameters: params)
    }

    public func fetchNewsKeywords() -> Single<[Keyword]> {
        fatalError("fetchNewsKeywords() has not been implemented")
    }

    public func new(keyword parameters: Parameters?) -> Completable {
        fatalError("new(keyword:) has not been implemented")
    }

    public func remove(keyword parameters: Parameters?) -> Completable {
        fatalError("remove(keyword:) has not been implemented")
    }

    public func fetchNewsToken() -> Single<Token> {
        fatalError("fetchNewsToken() has not been implemented")
    }

    public func modify(token parameters: Parameters?) -> Completable {
        fatalError("modify(token:) has not been implemented")
    }

    public func persist(token parameters: Parameters?) -> Completable {
        fatalError("presist(token:) has not been implemented")
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return moyaService.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        fatalError("writeInformation(info:) has not been implemented")
    }
}
