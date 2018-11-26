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

    func new(subscriber parameters: [String: String]) -> Completable

    func modify(keyword parameters: [String: String]) -> Completable

    func fetchFakeList() -> Single<FakeEntity>

    func persist(info entity: Info?) -> Completable
}
