//
//  UsersTableViewCell.swift
//  TestingEx
//
//  Created by Excell on 16/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    static let identifier = "UsersTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgView.layer.cornerRadius = imageView!.bounds.width / 2
        
    }
    
    func setupCell(user: Users) {
        self.lblName.text = "\(user.firstName ?? "...") \(user.lastName ?? "...")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
