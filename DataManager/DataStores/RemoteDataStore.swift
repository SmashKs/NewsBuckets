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

    public func new(subscriber parameters: [String: String]) -> Completable {
        return moyaService.createSubscriber()
    }

    public func modify(keyword parameters: [String: String]) -> Completable {
        return moyaService.replaceKeywords()
    }

    public func fetchFakeList() -> Single<FakeEntity> {
        return moyaService.retrieveFakeList()
    }

    public func persist(info entity: Info?) -> Completable {
        fatalError("writeInformation(info:) has not been implemented")
    }
}
