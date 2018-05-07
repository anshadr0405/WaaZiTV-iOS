//
//  LoginVC.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import LGSideMenuController
class LoginVC: BaseVC {
    @IBOutlet weak var passwordField: WTTextField!
    
    @IBOutlet weak var userNameField: WTTextField!
       @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var segmentController: UISegmentedControl!
    var manager:LoginManager = LoginManager.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameField.text = "12755"
        self.passwordField.text = "542717"
    }
 
    
    @IBAction func segmentSelected(_ sender: Any) {
        
    }
    @IBAction func loginButtonClicked(_ sender: Any) {
        manager.registerUser(loginType: .Username, userName: self.userNameField.text!, passWord: self.passwordField.text!) { (status,response,errorMessage) in
            if status == .loading{
                APP_DELEGATE.showFullScreenLoadingIndicator()
            }
            else if status == .success{
                APP_DELEGATE.hideFullScreenLoadingIndicator()
                self.loadAuthenticationVC()
            }
            else{
               APP_DELEGATE.hideFullScreenLoadingIndicator()
               self.loadAuthenticationVC()
                print(errorMessage ?? "Login failed")

            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadHomeVC() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func loadAuthenticationVC() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}


