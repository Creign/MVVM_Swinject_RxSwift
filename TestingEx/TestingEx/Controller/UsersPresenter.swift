//
//  UsersPresenter.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit

class UsersPresenter {
    var view: UsersViewController?
    
    func attachView(view: UsersViewController) {
        self.view = view
    }
    
    func getUsers() {
        view?.showProgress()
        UsersServices.getUsers(callback: { success, data, error in
            self.view?.hideProgress()
            
            if let users = data, !users.isEmpty {
                self.view?.reloadList(data: users)
            }
        })
    }
}
