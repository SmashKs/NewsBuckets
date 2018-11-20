//
//  NewsConfig+Moya.swift
//  NewsBuckets
//
//  Created by Jieyi on 2018/05/22.
//  Copyright © 2018 SmashKs All rights reserved.
//

import Moya

public enum NewsMoyaConfig {
    case retrieveFakeList
}

extension NewsMoyaConfig: TargetType {
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    public var baseURL: URL {
        return URL(string: "http://172.16.31.166:3000")!
    }

    public var path: String {
        switch self {
            case .retrieveFakeList:
                return "/api/v1/info/list"
        }
    }

    public var method: Moya.Method {
        switch self {
            case .retrieveFakeList:  // Get restful request.
                return .get
        }
    }

    public var task: Task {
        switch self {
            case .retrieveFakeList:  // Doesn't need the parameters.
                return .requestPlain
        }
    }

    /**
     For testing this api when there's no internet environment.
     */
    public var sampleData: Data {
        switch self {
            case .retrieveFakeList:
                return "{\"id\": 123}".data(using: .utf8)!
        }
    }
}
