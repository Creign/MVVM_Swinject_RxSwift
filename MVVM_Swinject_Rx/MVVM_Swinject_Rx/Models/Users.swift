//
//  Users.swift
//  MVVM_Swinject_Rx
//
//  Created by Excell on 26/03/2019.
//  Copyright © 2019 Excell. All rights reserved.
//

import Foundation
import ObjectMapper

class UsersList: Mappable {
    var page: Int?
    var perPage: Int?
    var pages: Int?
    var total: Int?
    var totalPages: Int?
    var data: [Users]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.page <- map["page"]
        self.perPage <- map["per_page"]
        self.total <- map["total"]
        self.totalPages <- map["total_pages"]
        self.data <- map["data"]
    }
}


class Users: Mappable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.firstName <- map["first_name"]
        self.lastName <- map["last_name"]
        self.avatar <- map["avatar"]
    }

}
