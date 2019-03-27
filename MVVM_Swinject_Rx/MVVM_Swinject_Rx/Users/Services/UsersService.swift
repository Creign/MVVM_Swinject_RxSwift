//
//  UsersService.swift
//  MVVM_Swinject_Rx
//
//  Created by Excell on 26/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

typealias UsersCompletionHandler = (_ token: String, _ error: Error?) -> Void

struct UserSearch {
    let count: Int
    let users: [Users]
}

class UsersService {
    
    var provider: MoyaProvider<NetworkService>!
    
    init(provider: MoyaProvider<NetworkService>) {
        self.provider = provider
    }
    
    func getUsers() -> Observable<UsersList> {
        return (provider?.rx.request(.getUsers())
            .mapObject(UsersList.self)
            .asObservable())!
    }
}
