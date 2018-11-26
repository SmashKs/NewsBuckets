//
//  SecondSecondInteractor.swift
//  NewsBuckets
//
//  Created by Jieyi on 01/06/2018.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager

class SecondInteractor: SecondInteractorInput {
    var repository: Repository!

    init(repository data: Repository) {
        repository = data
    }
}
