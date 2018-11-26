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
    var repository: Repository!

    init(repository data: Repository) {
        repository = data
    }

    func addSubscriber() -> Completable {
        return repository.add(subscriber: [:])
    }

    func getFakeList() -> Single<FakeEntity> {
        return repository.getFakeList()
    }

    func keepInformationEntity(info entity: Info) -> Completable {
        return repository.keep(info: entity).thruInternet()
    }
}
