//
//  MainViewController.swift
//  NewsBuckets
//
//  Created by Jieyi on 15/05/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import FirebaseInstanceID
import RxCocoa
import RxSwift
import UIKit
import Utility

class MainViewController: UIViewController, MainViewInput {
    var presenter: MainPresenterInput!
    var disposable = DisposeBag()
    @IBOutlet var btnGoToNext: UIButton!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewIsReady()

        btnGoToNext.rx.tap.subscribe(onNext: {
            self.presenter.gotoNext(vc: self)
        }).disposed(by: disposable)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        InstanceID.instanceID().instanceID { res, error in
            if let error = error {
                loge(error)
            } else if let res = res {
                self.presenter.addSubscriber(firebaseToken: res.token)
            }
        }
    }

    // MARK: - MainViewInput

    func setupInitialState() {
    }
}
