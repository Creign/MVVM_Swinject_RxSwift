//
//  MoyaResponse+Extensions.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import Moya

extension Response {
    var json: Any? {
        do {
            let json = try JSONSerialization.jsonObject(with: self.data, options: [])
            return json
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    var success: Bool {
        return self.statusCode == 200
    }
    
    var unauthenticated: Bool {
        return self.statusCode == 401
    }
}
