//
//  RemoteService.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

public protocol RemoteDataService {
    func createSubscriber(parameters: [String: Any]) -> Single<Token>

    func replaceKeywords(parameters: [String: Any]) -> Single<Token>

    func retrieveFakeList() -> Single<FakeEntity>
}
