//
//  ViewModelAssembly.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UsersViewModeling.self) { r in
            UsersViewModel(useCase: r.resolve(UsersUseCase.self)!)
        }
    }
}
