//
//  UsersDetailsViewController.swift
//  TestingEx
//
//  Created by Excell on 19/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit
import Kingfisher

//protocol UsersDetailsViewControllerDelegate {
//    func showDetails(user: Users)
//}

class UsersDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var user: Users?
    
    override func viewDidLoad() {
        showDetails(user: user!)
    }
    
    func showDetails(user: Users) {
        lblID.text = "ID: \(String(user.id!))"
        lblName.text = "\(user.firstName ?? "") \(user.lastName ?? "")"
        let strURL = user.avatar
        let resource = ImageResource(downloadURL: URL(string: strURL!)!, cacheKey: strURL)
        imgUser.kf.setImage(with: resource)

    }
}
