//
//  MainInteractorInput.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import RxSwift

/// The interactor between data layer and presentation layer.
/// Using prefix name (get), (add), (update), (delete), (keep)
protocol MainInteractorInput: Interactable {
    func addSubscriber(_ token: String, _ firebaseToken: String) -> Completable

    func getFakeList() -> Single<FakeEntity>

    func keepInformationEntity(info entity: Info) -> Completable
}
