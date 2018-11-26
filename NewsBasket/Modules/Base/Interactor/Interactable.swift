 //
//  Interactor.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/17.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager

protocol Interactable: class {
    var repository: Repository! { get set }
}
