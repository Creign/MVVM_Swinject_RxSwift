//
//  UsersViewModel.swift
//  MVVM_Swinject_Rx
//
//  Created by Excell on 26/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import RxSwift
import RxCocoa

protocol UsersViewModeling {
//    var searchText: PublishSubject<String> { get }
    var searchText: BehaviorRelay<String> { get }
    
    var cellModel: BehaviorRelay<Users> { get }
}

class UsersViewModel: UsersViewModeling {
    
    var usersService: UsersService?
    
    var searchText: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var cellModel: BehaviorRelay<Users>?
//    var users: Variable<[Users]> = Variable<[Users]>([])
    
    let disposeBag = DisposeBag()
    
    init(usersService: UsersService) {
        self.usersService = usersService
        
//        print(usersService)
//
//        let searchResults = searchText
//            .throttle(0.3, scheduler: MainScheduler.instance)
//            .observeOn(MainScheduler.instance)
////            .flatMapLatest( )
//
//        print("test: \(searchText.value)")
//        print("results: \(searchResults)")
        
        let results = searchText
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .observeOn(MainScheduler.instance)
        
        results.subscribe(onNext: { (searchString) in
            usersService.getUsers().subscribe(onNext: { (users) in
                self.cellModel = users
            }, onError: { (error) in
                print(error)
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
}
