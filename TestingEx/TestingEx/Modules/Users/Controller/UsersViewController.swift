//
//  UsersViewController.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit
import RxSwift

protocol UserInteractor {
    func reloadList(data: [Users])
    func showUser(user: Users)
}

class UsersViewController: UIViewController {
    
    var viewModel: UsersViewModeling?
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = UsersPresenter()
    var users = [Users]()
    
    override func viewDidLoad() {
        print(viewModel)
//        presenter.attachView(view: self)
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        presenter.getUsers()
    }
    
    func setupView() {
        
//        tableView.rowHeight = UsersTableViewCell.rowHeight
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
//
//        tableView.register(UINib(nibName: UsersTableViewCell.getCellIdentifier(), bundle: nil), forCellReuseIdentifier: UsersTableViewCell.getCellIdentifier())
        
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showUser(user: users[indexPath.row])
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.getCellIdentifier(), for: indexPath) as? UsersTableViewCell {

            cell.setupCell(user: users[indexPath.row])
            return cell
        }

        return UITableViewCell()
    }
}
//
//extension UsersViewController: UsersDelegate {
//    func reloadList(data: [Users]) {
//        users = data
//        tableView.reloadData()
//    }
//}
