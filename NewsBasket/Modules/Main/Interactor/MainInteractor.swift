//
//  MainInteractor.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import RxSwift

class MainInteractor: MainInteractorInput {
    var repository: DataStore!

    init(repository data: DataStore) {
        repository = data
    }

    func addSubscriber() -> Completable {
        return repository.newSubscriber()
    }

    func getFakeList() -> Single<FakeEntity> {
        return repository.fetchFakeList()
    }

    func keepInformationEntity(info entity: Info) -> Completable {
        return repository.persist(info: entity).thruInternet()
    }
}
