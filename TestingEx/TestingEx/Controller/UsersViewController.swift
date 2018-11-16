//
//  UsersViewController.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit

protocol UsersDelegate {
    func reloadList(data: [Users])
}

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = UsersPresenter()
    var users = [Users]()
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.getUsers()
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: UsersTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UsersTableViewCell.identifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath)
        
        cell.textLabel?.text = users[indexPath.row].firstName
        
        return cell
    }
}

extension UsersViewController: UsersDelegate {
    func reloadList(data: [Users]) {
        users = data
        tableView.reloadData()
    }
}
