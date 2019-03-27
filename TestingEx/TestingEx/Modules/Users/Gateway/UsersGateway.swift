//
//  UsersGateway.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper

typealias UsersCompletionHandler = (_ token: String, _ error: Error?) -> Void

class UsersGateway {
    
    var provider: MoyaProvider<NetworkService>!
    
    init(provider: MoyaProvider<NetworkService>) {
        self.provider = provider
    }
    
    func getUsers() -> Observable<Users> {
        return provider.rx.request(NetworkService.getUsers())
            .mapObject(Users.self)
            .asObservable()
    }
}
