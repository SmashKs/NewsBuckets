//
//  SecondSecondViewController.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit
import FirebaseInstanceID
import Utility

class SecondViewController: UIViewController, SecondViewInput {
    @IBOutlet var tfKeyword: UITextField!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var tvKeywords: UITableView!

    var presenter: SecondPresentInput!
    var disposable = DisposeBag()

    private var list = ["dfasf", "fdaf", "aaaa", "bvvvv"]
    private var indexPath: IndexPath? = nil
    private var deletedItemIndex = -1

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tvKeywords.delegate = self
        tvKeywords.dataSource = self

        presenter.getKeywordList()

        btnSend.rx.tap.subscribe(onNext: {
            if let text = self.tfKeyword.text {
                if !text.isEmpty {
                    self.presenter.add(text)
                }
            }
            self.tfKeyword.text = ""
            self.tfKeyword.endEditing(true)
        }

        ).disposed(by: disposable)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.getKeywordList()
    }

// MARK: SecondViewInput

    func setupInitialState() {
    }

    func getKeywordList() -> [String] {
        return list
    }

    func setList(of keywords: [String]) {
        list = keywords
        tvKeywords.reloadData()
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KeywordCell") as? KeywordCell else {
            fatalError()
        }

        cell.keywordCellLabel.text = list[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            InstanceID.instanceID().instanceID { result, error in
                if let result = result {
                    self.presenter.delete(self.list[indexPath.row])

                    self.list.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)

                    let strings = self.list.joined(separator: ",")
                    self.presenter.updateSubscriber(firebaseToken: result.token, keywords: strings)
                }
            }
        }
    }
}
