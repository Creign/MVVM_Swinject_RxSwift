//
//  NetworkAssembly.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class NetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(UsersGateway.self, initializer: UsersGateway.init).inObjectScope(.container)
    }
}
