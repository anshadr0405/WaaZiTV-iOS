//
//  LoginVC.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    @IBOutlet weak var passwordField: WTTextField!
    
    @IBOutlet weak var userNameField: WTTextField!
       @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var segmentController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
 
    
    @IBAction func segmentSelected(_ sender: Any) {
        
    }
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


