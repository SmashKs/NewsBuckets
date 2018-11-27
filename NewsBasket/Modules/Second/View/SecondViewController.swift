//
//  SecondSecondViewController.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RxSwift
import UIKit

class SecondViewController: UIViewController, SecondViewInput {
    @IBOutlet var tfKeyword: UITextField!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var tvKeywords: UITableView!

    var presenter: SecondPresentInput!
    var disposable = DisposeBag()

    private var list = ["dfasf", "fdaf", "aaaa", "bvvvv"]

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tvKeywords.delegate = self
        tvKeywords.dataSource = self
    }

    // MARK: SecondViewInput

    func setupInitialState() {
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
}
