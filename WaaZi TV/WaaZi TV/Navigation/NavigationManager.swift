//
//  NavigationManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 11/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class NavigationManager: NSObject {
 static let sharedInstance = NavigationManager()
    func setRootAsLoginVC(){
        let loginVC:BaseVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! BaseVC
        APP_DELEGATE.changeRootViewController(viewController: loginVC)
    }
    
}
