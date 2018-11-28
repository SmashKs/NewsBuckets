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

    func add(subscriber parameters: TokenP?) -> Single<Token>

    func update(keyword parameters: KeywordP?) -> Single<Token>

    func getNewsToken() -> Single<Token>

    func getKeywords() -> Single<[Keyword]>

    func add(keyword parameters: KeywordP?) -> Completable

    func delete(keyword parameters: KeywordP?) -> Completable

    func update(token parameters: TokenP) -> Completable

    func keep(token parameters: TokenP) -> Completable

    func getFakeList() -> Single<FakeEntity>

    func keep(info entity: Info?) -> Completable
}
