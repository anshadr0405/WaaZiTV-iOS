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
               self.messageLabel.text = "Authenticating.."
            }
            else if status == .success{
                
                self.homeManager.getGroupsService(completion: { (status, response, errorMessage) in
                    if status == .loading{
                        
                    }
                    else if status == .success{
                        self.activityIndicator.stopAnimating()
                        self.messageLabel.text = "Success.."
                        self.loadHomeVC()
                        
                    }
                    else{
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.messageLabel.text = "Failed.."
                    }
                })
            }
            else{
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.messageLabel.text = "Failed.."
            }
                
            }

}
    func loadHomeVC() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LGSideMenuController") as! LGSideMenuController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}
