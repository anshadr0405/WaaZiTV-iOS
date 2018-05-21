//
//  AuthenticationVC.swift
//  WaaZi TV
//
//  Created by anshad on 07/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import LGSideMenuController
class AuthenticationVC: UIViewController {
    @IBOutlet weak var centerView: UIView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var messageLabel: UILabel!
    var homeManager:HomeManager = HomeManager.sharedInstance
    var authenticationManager:AuthenticationManager = AuthenticationManager.sharedInstance

    @IBOutlet weak var loginAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          authenticateUserAndGetGroups()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func authenticateUserAndGetGroups(){
        authenticationManager.userAuthentiationService { (status, response, errorMessage) in
            if status == .loading{
               self.activityIndicator.startAnimating()
               self.activityIndicator.isHidden = false
               self.messageLabel.text = "Verifying User.."
            }
            else if status == .success{
                  self.messageLabel.text = "User Verification Completed"
                self.homeManager.getGroupsService(completion: { (status, response, errorMessage) in
                    if status == .loading{
                        self.messageLabel.text = "Fetching UserData.."
                    }
                    else if status == .success{
                        self.activityIndicator.stopAnimating()
                        self.messageLabel.text = "Done.."
                        self.loadHomeVC()
                        
                    }
                    else{
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                         self.messageLabel.text = "Oops!! Something went wrong.."
                         self.loginAgainButton.isHidden = false

                    }
                })
            }
            else{
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.messageLabel.text = "Oops!! Something went wrong.."
                self.loginAgainButton.isHidden = false
            }
                
            }

}
    @IBAction func loginAgainButtonClicked(_ sender: Any) {
        
        loadLoginVC()
    }
    func loadHomeVC() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func loadLoginVC() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}
