//
//  UsersViewModel.swift
//  TestingEx
//
//  Created by Excell on 25/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol UsersViewModeling {
//    var searchText: Variable<String> { get }
//    var results: Observable<Users> { get }
}

class UsersViewModel: UsersViewModeling {
//    let searchText: Variable<String>
//    let results: Observable<Users> = Observable<Users>()
    var useCase: UsersUseCase?
    let disposeBag = DisposeBag()

    init(useCase: UsersUseCase) {
        self.useCase = useCase
    }

    func getUsers() {
        useCase?.getUsers().subscribe(onNext: { (users) in
            print(users)
        }, onError: { (error) in
            print(error)
        }).disposed(by: disposeBag)
    }
    
    
}
