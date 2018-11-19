//
//  UsersTableViewCell.swift
//  TestingEx
//
//  Created by Excell on 16/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit
import Kingfisher

class UsersTableViewCell: UITableViewCell {

    static let rowHeight: CGFloat = 60
    
    static func getCellIdentifier() -> String {
        return String(describing: self)
    }
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        
    }
    
    func setupCell(user: Users) {
        if let strURL = user.avatar {
            let resource = ImageResource(downloadURL: URL(string: strURL)!, cacheKey: strURL)
            self.imgView.kf.setImage(with: resource)
        }
        
        self.lblName.text = "\(user.firstName ?? "...") \(user.lastName ?? "...")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }

}
