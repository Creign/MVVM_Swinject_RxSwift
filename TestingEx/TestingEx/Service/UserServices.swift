//
//  UserServices.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import RxSwift
import ObjectMapper

class UserServices {
    static let disposeBag = DisposeBag()
    static func getUsers(callback: @escaping (Bool, [Users]?, String?) -> Void) {
        apiProvider.rx
            .request(.getUsers())
            .subscribe { event in
                switch event {
                case .success(let response):
                    if response.success {
//                        print(response.json)
                        let data = Mapper<Users>().mapArray(JSONObject: response.json)
                        print(data)
                        callback(true, data, nil)
                    } else {
                        callback(false, nil, "Error")
                    }
                case .error(let err):
                    print(err.localizedDescription)
                    callback(false, nil, err.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}


