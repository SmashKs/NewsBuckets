//
//  Repository.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-26.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import RxSwift

/// The interactor between data layer and presentation layer.
/// Using prefix name (get), (add), (update), (delete), (keep)
public protocol Repository {
    func get(newses parameters: [String: Any]) -> Completable

    func add(subscriber parameters: TokenP?) -> Completable

    func update(keyword parameters: KeywordP?) -> Completable

    func getNewsToken() -> Single<Token>

    func update(token parameters: TokenP) -> Completable

    func keep(token parameters: TokenP) -> Completable

    func getFakeList() -> Single<FakeEntity>

    func keep(info entity: Info?) -> Completable
}
