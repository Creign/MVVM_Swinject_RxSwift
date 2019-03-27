//
//  NetworkService.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import Moya

public enum NetworkService {
    case getUsers()
}

extension NetworkService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://reqres.in/")!
    }
    
    public var path: String {
        switch self {
        case .getUsers():
            return "api/users"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}


