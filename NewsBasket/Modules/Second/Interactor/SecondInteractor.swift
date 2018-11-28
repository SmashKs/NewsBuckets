//
//  SecondSecondInteractor.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import RxSwift
import Utility

class SecondInteractor: SecondInteractorInput {
    var repository: Repository!

    init(repository data: Repository) {
        repository = data
    }

    func updateSubscriber(firebaseToken token: String, keywords str: String) -> Completable {
        return repository.getNewsToken().flatMapCompletable { entity in
            let parameter = KeywordP(entity.token, token, str)

            logw(parameter)

            return self.repository.update(keyword: parameter).asCompletable()
        }
    }

    func getKeywords() -> Single<[Keyword]> {
        return repository.getKeywords()
    }

    func add(keyword str: String) -> Completable {
        return repository.add(keyword: KeywordP(defaultString, defaultString, str))
    }

    func delete(keyword str: String) -> Completable {
        return repository.delete(keyword: KeywordP(defaultString, defaultString, str))
    }
}
