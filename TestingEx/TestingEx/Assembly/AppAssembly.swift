//
//  AppAssembly.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(UsersViewController.self) { (resolver, controller) in
            controller.viewModel = resolver.resolve(UsersViewModeling.self)
        }
        
        container.storyboardInitCompleted(UsersDetailsViewController.self) { (resolver, controller) in
            
        }
    }
}

