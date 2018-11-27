//
//  RepositoryConfigurator.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/24.
//  Copyright © 2018 SmashKs All rights reserved.
//

import DataManager
import Swinject

class RepositoryConfigurator: Assembly {
    func assemble(container: Container) {

        // MARK: - Necessary Objects.

        container.register(DataStore.self, name: "local") {
            LocalDataStore(realm: $0.resolve(LocalDataService.self, name: "realm")!,
                           mmkv: $0.resolve(LocalDataService.self, name: "mmkv")!)
        }
        container.register(DataStore.self, name: "remote") {
            RemoteDataStore(moya: $0.resolve(RemoteDataService.self, name: "moya")!)
        }

        // MARK: - Provides to others modules.

        container.register(Repository.self) {
            DataRepository(local: $0.resolve(DataStore.self, name: "local")!,
                           remote: $0.resolve(DataStore.self, name: "remote")!)
        }
    }
}
