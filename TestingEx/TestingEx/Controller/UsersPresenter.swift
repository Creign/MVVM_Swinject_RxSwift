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
        UserServices.getUsers(callback: { success, data, error in
            self.view?.hideProgress()
            print(data)
        })
    }
}
