//
//  NewsService+Moya.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/22.
//  Copyright © 2018 SmashKs All rights reserved.
//

import EVReflection
import Moya
import RxSwift

public class NewsService: RemoteDataService {
    private var provider: MoyaProvider<NewsMoyaConfig>
    private lazy var rxProvider = {
        provider.rx
    }()

    public init(_ provider: MoyaProvider<NewsMoyaConfig>) {
        self.provider = provider
    }

    public func createSubscriber() -> Completable {
        var request = rxProvider.request(NewsMoyaConfig.createSubscriber([:]))
        #if DEBUG
        request = request.debug()
        #endif
        return request.asCompletable()
    }

    public func replaceKeywords() -> Completable {
        fatalError("replaceKeywords() has not been implemented")
    }

    public func retrieveFakeList() -> RxSwift.Single<FakeEntity> {
        var request = rxProvider.request(NewsMoyaConfig.retrieveNewsList)
        #if DEBUG
        request = request.debug()
        #endif
        return request.Rmap(to: FakeEntity.self)
    }
}
