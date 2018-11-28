//
//  NewsRealm.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/22.
//  Copyright © 2018 SmashKs All rights reserved.
//

import RealmSwift
import RxSwift
import Utility

public class NewsRealm: LocalDataService {
    private var realm: Realm
    private lazy var realmPath = realm.configuration.fileURL!

    public init(_ realm: Realm) {
        self.realm = realm
    }

    // MARK: - Unsupported methods

    public func retrieveNewsToken() -> Single<Token> {
        fatalError("retrieveNewsToken() has not been implemented")
    }

    public func replace(token object: TokenObj) -> Completable {
        fatalError("replace(token:) has not been implemented")
    }

    public func create(token object: TokenObj) -> Completable {
        fatalError("create(token:) has not been implemented")
    }

    // MARK: - For local keywords

    public func retrieveNewsKeywords() -> Single<[Keyword]> {
        return Single.create { single in
            var list = Array(self.realm.objects(KeywordObj.self))
                .map { obj in
                    Keyword(obj.keyword)
                }

            single(.success(list))

            return Disposables.create()
        }
    }

    public func create(keyword object: KeywordObj) -> Completable {
        fatalError("createKeyword(keyword:) has not been implemented")
    }

    public func release(keyword object: KeywordObj) -> Completable {
        fatalError("release(keyword:) has not been implemented")
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
        return Single.just(realm.objects(TempObj.self))
            .map { _ -> FakeEntity in
                FakeEntity()
            }
    }

    public func update(info entity: Info) -> Completable {
        // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
        return Completable.create {
            do {
                try self.realm.write {
                    // FIXME: (jieyi 2018/05/22) Fix the object inheritance.
                    self.realm.add(TempObj())
                }
                $0(.completed)
            } catch {
                $0(.error(error))
            }

            return Disposables.create()
        }
    }

    public func remove(info entity: Info? = nil) -> Completable {
        return Completable.create { [weak self] completable in
            guard let strongSelf = self else {
                return Disposables.create()
            }

            do {
                // OPTIMIZE: (jieyi 2018/05/22) We can create a good add rx completable method.
                strongSelf.realm.delete(TempObj())
                completable(.completed)
            } catch {
                completable(.error(error))
            }

            return Disposables.create()
        }
    }
}

class TempObj: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var name: String = ""
}
