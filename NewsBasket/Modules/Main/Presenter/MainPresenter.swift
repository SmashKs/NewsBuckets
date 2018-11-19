//
//  MainPresenter.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import Utility
import RxSwift

class MainPresenter: MainPresenterInput {
    weak var view: MainViewInput!
    var interactor: MainInteractor!
    var router: MainRouterInput!

    func viewIsReady() {
    }

    func getList() {
        interactor
            .getFakeList()
            .subscribe { single in
                switch single {
                    case .success(let entity):
                        logd(entity)
                    case .error(let error):
                        loge(error)
                }
            }
            .disposed(by: view.disposable)
    }

    func gotoNext(vc: UIKit.UIViewController) {
        router.navigateToSecond(vc: vc)
    }
}
