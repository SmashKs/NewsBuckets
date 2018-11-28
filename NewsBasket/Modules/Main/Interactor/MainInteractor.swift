//
//  MainInteractor.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import RxSwift
import Utility

class MainInteractor: MainInteractorInput {
    var repository: Repository!

    init(repository data: Repository) {
        repository = data
    }

    func addSubscriber(_ firebaseToken: String) -> Completable {
        return repository
            .add(subscriber: TokenP(defaultString, firebaseToken))
            .flatMapCompletable { token -> Completable in
                logw(token)
                return self.repository.keep(token: TokenP(token.token, firebaseToken))
            }
    }

    func updateSubscriber(_ firebaseToken: String, _ keywords: String) -> Completable {
        return repository
            .getNewsToken()
            .flatMapCompletable { token -> Completable in
                return self.repository
                    .update(keyword: KeywordP(token.token, firebaseToken, keywords))
                    .asCompletable()
            }
    }

    func getList() -> Single<[Keyword]> {
        return repository.getKeywords()
    }

    func getFakeList() -> Single<FakeEntity> {
        return repository.getFakeList()
    }

    func keepInformationEntity(info entity: Info) -> Completable {
        return repository.keep(info: entity).thruInternet()
    }
}
