//
//  DataStore.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift

/// Interactor between data layer and presentation layer.
/// Using prefix name (fetch), (new), (modify), (remove), (persist)
public protocol DataStore {
    func fetch(newses parameters: [String: Any]) -> Completable

    func new(subscriber parameters: Parameters?) -> Single<Token>

    func modify(keyword parameters: Parameters?) -> Single<Token>

    func fetchNewsToken() -> Single<Token>

    func fetchNewsKeywords() -> Single<[Keyword]>

    func new(keyword object: KeywordObj) -> Completable

    func remove(keyword object: KeywordObj) -> Completable

    func modify(token parameters: Parameters?) -> Completable

    func persist(token parameters: Parameters?) -> Completable

    func fetchFakeList() -> Single<FakeEntity>

    func persist(info entity: Info?) -> Completable
}
