//
//  Users.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import Foundation
import ObjectMapper

struct Users: Mappable {
    var id: Int?
    var firstName: String?
    var lastName:String?
    var avatar: String?
    
    init?(map: Map) {
        if map.JSON["id"] == nil {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        avatar <- map["avatar"]
    }
}
