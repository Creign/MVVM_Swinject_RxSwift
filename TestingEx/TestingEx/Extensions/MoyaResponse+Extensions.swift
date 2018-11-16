//
//  MoyaResponse+Extensions.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import Moya
import SwiftyJSON

extension Response {
    var json: [[String: Any]]? {
        do {
//            let data = try JSONSerialization.jsonObject(with: self.data, options: [])
            let data = JSON(self.data)
            let obj = data["data"].arrayObject as Any
            let json = obj as! [[String: Any]]

            return json
        }
        catch let error as NSError {
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

