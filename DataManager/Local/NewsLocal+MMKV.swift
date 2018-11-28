//
//  NewsLocal+MMKV.swift
//  NewsBasket
//
//  Created by jieyi on 2018-11-27.
//  Copyright © 2018 Jieyi Wu. All rights reserved.
//

import RxSwift
import MMKV
import Utility

public class NewsMMKV: LocalDataService {
    private var mmkv: MMKV

    public init(_ mmkv: MMKV) {
        self.mmkv = mmkv
    }

    public func retrieveNewsToken() -> Single<Token> {
        return Single<Token>.create { single in
            let res = Token()
            if let firebaseToken = self.mmkv.object(of: NSString.self, forKey: "firebase token") as? String {
                res.firebaseToken = firebaseToken
            }
            if let token = self.mmkv.object(of: NSString.self, forKey: "token") as? String {
                res.token = token
            }
            single(.success(res))

            return Disposables.create()
        }
    }

    public func replace(token object: TokenObj) -> Completable {
        return create(token: object)
    }

    public func create(token object: TokenObj) -> Completable {
        return Completable.create { completable in
            var res = false

            if object.token != defaultString {
                res = res || self.mmkv.set(_: object.token, forKey: "token")
            }
            if object.firebaseToken != defaultString {
                res = res || self.mmkv.set(_: object.firebaseToken, forKey: "firebase token")
            }

            res ? completable(.completed) : completable(.error(RxError.noElements))

            return Disposables.create()
        }
    }

    // MARK: - Unsupported methods

    public func retrieveNewsKeywords() -> Single<Array<Keyword>> {
        fatalError("retrieveNewsKeywords() has not been implemented")
    }

    public func create(keyword object: KeywordObj) -> Completable {
        fatalError("createKeyword(keyword:) has not been implemented")
    }

    public func release(keyword object: KeywordObj) -> Completable {
        fatalError("release(keyword:) has not been implemented")
    }

    public func retrieveFakeList() -> Single<FakeEntity> {
        fatalError("retrieveFakeList() has not been implemented")
    }

    public func update(info entity: Info) -> Completable {
        fatalError("update(info:) has not been implemented")
    }

    public func remove(info entity: Info?) -> Completable {
        fatalError("remove(info:) has not been implemented")
    }
}