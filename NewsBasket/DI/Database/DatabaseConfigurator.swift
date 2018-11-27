//
//  DatabaseConfigurator.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/24.
//  Copyright © 2018 SmashKs All rights reserved.
//

import CoreData
import DataManager
import MMKV
import RealmSwift
import Swinject

class DatabaseConfigurator: Assembly {
    func assemble(container: Container) {

        // MARK: - Necessary Objects

        // For Realm
        container.register(Realm.self) { _ in
            do {
                return try Realm()
            } catch {
                fatalError("Creating a Realm()'s object failed!")
            }
        }
        // For MMKV
        container.register(MMKV.self) { _ in
            MMKV.default()
        }

        // MARK: - Provide to the others Assembly

        container.register(LocalDataService.self, name: "realm") {
            NewsRealm($0.resolve(Realm.self)!)
        }

        container.register(LocalDataService.self, name: "mmkv") {
            NewsMMKV($0.resolve(MMKV.self)!)
        }
    }
}
