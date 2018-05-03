//
//  WTTextField.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class WTTextField: UITextField {
    let border = CALayer()
    override func draw(_ rect: CGRect) {
        let width = CGFloat(1.0)
        border.borderColor = UIColor.getAppThemeColor().cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    

    
    
}
