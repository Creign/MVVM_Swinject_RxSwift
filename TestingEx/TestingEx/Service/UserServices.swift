//
//  UserServices.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import RxSwift
import ObjectMapper

class UsersServices {
    
    static let disposeBag = DisposeBag()
    
    static func getUsers(callback:@escaping (Bool, [Users]?, String?) -> Void) {
        apiProvider.rx
            .request(API.getUsers())
            .subscribe { event in
                switch event {
                case let .success(response):
                    if response.success {
                        print(response.json)
                        let data = Mapper<Users>().mapArray(JSONObject: response.json)
                        print(data)
                        callback(true, data, nil)
                    }
                    else {
                        callback(false, nil, "Error")
                    }
                case let .error(error):
                    print(error.localizedDescription)
                    callback(false, nil, "Something went wrong!")
                }
            }
            .disposed(by: disposeBag)
    }
}
