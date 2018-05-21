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
    
    @IBOutlet weak var userNameErrorLabel: UILabel!
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    var loginType:LoginType = LoginType.Username
    var manager:LoginManager = LoginManager.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameField.text = "12755"
        self.passwordField.text = "542717"
       // setupView()

        
    }
 
    func setupView()  {
           validator.registerField(userNameField, errorLabel: userNameErrorLabel, rules: [RequiredRule()])
             validator.registerField(passwordField, errorLabel: passwordErrorLabel, rules: [RequiredRule()])
    }
    
    
    @IBAction func segmentSelected(_ sender: Any) {
        let segment:UISegmentedControl = sender as! UISegmentedControl
        let selectedIndex = segment.selectedSegmentIndex
        switch selectedIndex {
        case 0:
              self.userNameField.isHidden = false
              self.userNameField.placeholder = "Username"
              self.passwordField.placeholder = "Password"
              loginType = LoginType.Username
              
            break
        case 1:
              self.userNameField.isHidden = false
              self.userNameField.placeholder = "Email"
              self.passwordField.placeholder = "Password"
              loginType = LoginType.Email

            break
        case 2:
               self.passwordField.placeholder = "Voucher Code"
                self.userNameField.isHidden = true
               loginType = LoginType.VoucherCode

            break
       
        default:
            
            break
        }
    }
    @IBAction func loginButtonClicked(_ sender: Any) {
        //self.validate()
        manager.registerUser(loginType:loginType, userName: self.userNameField.text!, passWord: self.passwordField.text!) { (status,response,errorMessage) in
            if status == .loading{
                APP_DELEGATE.showFullScreenLoadingIndicator()
            }
            else if status == .success{
                APP_DELEGATE.hideFullScreenLoadingIndicator()
                self.loadAuthenticationVC()
            }
            else{
                APP_DELEGATE.hideFullScreenLoadingIndicator()
//                AlertManager.sharedInstance.showAlert(title: nil, message: "Incorrect Username or Password", vc: self)
//                print(errorMessage ?? "Login failed")
                  self.loadAuthenticationVC()
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
    
    
    override func validationSuccessful() {
        print("test")
       
    }
    
    override func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        print("test")
        for (field, error) in errors {
            if let field = field as? UITextField {
                field.layer.borderColor = UIColor.red.cgColor
                field.layer.borderWidth = 1.0
            }
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
}


