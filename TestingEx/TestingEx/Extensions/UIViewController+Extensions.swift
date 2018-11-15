//
//  UIViewController+Extensions.swift
//  TestingEx
//
//  Created by Excell on 15/11/2018.
//  Copyright © 2018 Excell. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    func showProgress() {
        SVProgressHUD.show()
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    func hideProgress() {
        SVProgressHUD.dismiss()
    }
}
