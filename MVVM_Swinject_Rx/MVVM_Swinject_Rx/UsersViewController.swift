//
//  UsersViewController.swift
//  MVVM_Swinject_Rx
//
//  Created by Excell on 26/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UsersViewController: UIViewController {

    var viewModel: UsersViewModeling?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    func setupBindings() {
        searchbar.rx.text.orEmpty
            .bind(to: viewModel!.searchText)
            .disposed(by: disposeBag)
        
//        viewModel?.cellModel
//            .bind(to: self.usersTableView.rx.items(cellIdentifier: UsersTableViewCell.getIdentifier(),
//                                              cellType: UsersTableViewCell.self)) {
//                i, cellModel, cell in
//                cell.viewModel = cellModel
//            }.disposed(by: disposeBag)
        
//        let results = searchbar.rx.text
//            .throttle(0.3, scheduler: MainScheduler.instance)
//            .observeOn(MainScheduler.instance)
//
//        results.subscribe(onNext: { (searchString) in
//            print(searchString)
//        }).disposed(by: disposeBag)
        
        
    }


}

