//
//  SecondSecondPresenter.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift
import FirebaseInstanceID
import Utility

class SecondPresenter: SecondPresentInput {
    weak var view: SecondViewInput!
    var interactor: SecondInteractorInput!
    var router: SecondRouterInput!

    func viewIsReady() {
    }

    func getKeywordList() {
        interactor
            .getKeywords()
            .subscribe { event in
                switch event {
                    case .success(let list):
                        let keywords = list.map { key -> String in
                            key.keyword!
                        }
                        self.view.setList(of: keywords)
                    case .error(let error):
                        loge(error)
                }
            }.disposed(by: view.disposable)
    }

    func add(_ keyword: String) {
        interactor
            .add(keyword: keyword)
            .subscribe { event in
                switch event {
                    case .completed:
                        self.view.setList(of: self.view.getKeywordList() + [keyword])
                        InstanceID.instanceID().instanceID { result, error in
                            if let result = result {
                                let keys = self.view.getKeywordList().joined(separator: ",")
                                self.updateSubscriber(firebaseToken: result.token, keywords: keys)
                            }
                        }
                    case .error(let error):
                        loge(error)
                }
            }.disposed(by: view.disposable)
    }

    func delete(_ keyword: String) {
        interactor
            .delete(keyword: keyword)
            .subscribe { event in
                switch event {
                    case .completed:
                        logw("finished!!")
                    case .error(let error):
                        loge(error)
                }
            }.disposed(by: view.disposable)
    }

    func updateSubscriber(firebaseToken: String, keywords: String) {
        interactor
            .updateSubscriber(firebaseToken: firebaseToken, keywords: keywords)
            .subscribe { completable in
                switch completable {
                    case .completed:
                        logw("finished!!")
                    case .error(let error):
                        loge(error)
                }
            }.disposed(by: view.disposable)
    }
}
