//
//  UsersUseCase.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import RxSwift

class UsersUseCase {
    var gateway: UsersGateway?
    
    init(gateway: UsersGateway) {
        self.gateway = gateway
    }
    
    func getUsers() -> Observable<Users> {
        return (gateway?.getUsers())!
    }
}
