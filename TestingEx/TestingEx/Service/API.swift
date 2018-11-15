//
//  API.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import Foundation
import Moya

let apiProvider = MoyaProvider<API>()

enum API {
    case getUsers()
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://reqres.in/")!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "api/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getUsers:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

