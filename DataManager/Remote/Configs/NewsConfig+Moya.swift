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
    case retrieveNewsList
    case createSubscriber([String: Any])
    case replaceKeywords([String: Any])
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
            let apiRequest = (dict["ApiRequestString"]) as! String
            var tail: String {
                switch self {
                    case .retrieveNewsList:
                        return "news/"
                    case .createSubscriber,
                         .replaceKeywords:
                        return "subscriber/"
                }
            }

            return "\(apiRequest)\(tail)"
        }
        fatalError("There's no restful api url.")
    }

    public var method: Moya.Method {
        switch self {
            case .retrieveNewsList: // Get restful request.
                return .get
            case .createSubscriber:
                return .post
            case .replaceKeywords:
                return .put
        }
    }

    public var task: Task {
        switch self {
            case .retrieveNewsList: // Doesn't need the parameters.
                return .requestPlain
            case .createSubscriber(let params):
                return .requestParameters(parameters: ["token": "1234",
                                                       "firebase_token": "213123"], encoding: JSONEncoding.default)
            case .replaceKeywords(let params):
                return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        }
    }

    /// For testing this api when there's no internet environment.
    public var sampleData: Data {
        switch self {
            case .retrieveNewsList:
                return "{\"id\": 123}".data(using: .utf8)!
            case .createSubscriber:
                return "{}".data(using: .utf8)!
            case .replaceKeywords:
                return "{}".data(using: .utf8)!
        }
    }
}
