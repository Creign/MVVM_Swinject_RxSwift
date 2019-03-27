//
//  AppDelegate.swift
//  MVVM_Swinject_Rx
//
//  Created by Excell on 26/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import UIKit
import Moya
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var container: Container!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        container = Container() { container in
            container.autoregister(UsersViewModeling.self, initializer: UsersViewModel.init).inObjectScope(.container)
            
            container.storyboardInitCompleted(UsersViewController.self) { r,c in
                c.viewModel = r.resolve(UsersViewModeling.self)!
            }
            
            container.register(MoyaProvider<NetworkService>.self, factory: { resolver in
                return MoyaProvider<NetworkService>()
            })
            
            
            container.autoregister(UsersService.self, initializer: UsersService.init).inObjectScope(.container)

        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        self.window = window
        let bundle = Bundle(for: UsersViewController.self)
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: bundle, container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

