//
//  SecondSecondInteractorInput.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import RxSwift

protocol SecondInteractorInput: Interactable {
    func updateSubscriber(firebaseToken token: String, keywords str: String) -> Completable

    func getKeywords() -> Single<[Keyword]>

    func add(keyword str: String) -> Completable

    func delete(keyword str: String) -> Completable
}
