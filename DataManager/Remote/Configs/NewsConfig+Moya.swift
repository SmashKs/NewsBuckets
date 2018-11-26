//
//  NewsConfig+Moya.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/22.
//  Copyright © 2018 SmashKs All rights reserved.
//

import Moya
import Utility

/// All of the interface for the restful network.
/// Using prefix name (retrieve), (create), (replace), (release)
public enum NewsMoyaConfig {
    case retrieveFakeList
    case createSubscriber
}

extension NewsMoyaConfig: TargetType {
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    public var baseURL: URL {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) {
            return URL(string: dict["UrlDomainString"] as! String)!
        }

        fatalError("There's no domain url.")
    }

    public var path: String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path) {
            switch self {
                case .retrieveFakeList:
                    return "/api/v1/info/list"
                case .createSubscriber:
                    return dict["PutApiSubscriberString"] as! String
            }
        }
        fatalError("There's no restful api url.")
    }

    public var method: Moya.Method {
        switch self {
            case .retrieveFakeList: // Get restful request.
                return .get
            case .createSubscriber:
                return .put
        }
    }

    public var task: Task {
        switch self {
            case .retrieveFakeList: // Doesn't need the parameters.
                return .requestPlain
            case .createSubscriber:
                return .requestPlain
        }
    }

    /// For testing this api when there's no internet environment.
    public var sampleData: Data {
        switch self {
            case .retrieveFakeList:
                return "{\"id\": 123}".data(using: .utf8)!
            case .createSubscriber:
                return "{}".data(using: .utf8)!
        }
    }
}
