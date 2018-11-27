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
import Utility

public class NewsService: RemoteDataService {
    private var provider: MoyaProvider<NewsMoyaConfig>
    private lazy var rxProvider = {
        provider.rx
    }()

    public init(_ provider: MoyaProvider<NewsMoyaConfig>) {
        self.provider = provider
    }

    public func createSubscriber(parameters: [String: Any]) -> Single<Token> {
        var request = rxProvider.request(NewsMoyaConfig.createSubscriber(parameters))
        #if DEBUG
        request = request.debug()
        #endif
        return request.do(onNext: {
            if (String($0.statusCode).flatMap {
                Int(String($0))
            }[0] != 2) {
                throw MoyaError.statusCode($0)
            }
        }).Rmap(to: Token.self)
    }

    public func replaceKeywords(parameters: [String: Any]) -> Single<Token> {
        var request = rxProvider.request(NewsMoyaConfig.replaceSubscriber(parameters))
        #if DEBUG
        request = request.debug()
        #endif
        return request.do(onNext: {
            if (String($0.statusCode).flatMap {
                Int(String($0))
            }[0] != 2) {
                throw MoyaError.statusCode($0)
            }
        }).Rmap(to: Token.self)
    }

    public func retrieveFakeList() -> RxSwift.Single<FakeEntity> {
        var request = rxProvider.request(NewsMoyaConfig.retrieveNewsList)
        #if DEBUG
        request = request.debug()
        #endif
        return request.Rmap(to: FakeEntity.self)
    }
}
