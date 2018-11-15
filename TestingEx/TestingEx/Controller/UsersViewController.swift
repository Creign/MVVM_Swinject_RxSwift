//
//  UsersViewController.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit

//protocol UsersDelegate {
//    func getUsers()
//}

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = UsersPresenter()
    var users = [Users]()
    
    override func viewDidLoad() {
        presenter.getUsers()
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
}

//extension UsersViewController: UsersDelegate {
//    func getUsers() {
//
//    }
//}
