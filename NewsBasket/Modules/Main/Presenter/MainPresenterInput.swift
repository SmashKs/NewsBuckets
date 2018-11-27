//
//  MainViewOutput.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import UIKit

protocol MainPresenterInput: Presentable {
    var view: MainViewInput! { get set }
    var interactor: MainInteractor! { get set }
    var router: MainRouterInput! { get set }

    func viewIsReady()

    func addSubscriber(token: String, firebaseToken: String)

    func getList()

    func gotoNext(vc: UIViewController)
}
