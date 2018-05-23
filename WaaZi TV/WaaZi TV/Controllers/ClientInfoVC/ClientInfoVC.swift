//
//  ClientInfoVCViewController.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 23/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ClientInfoVC: BaseVC {

    @IBOutlet weak var packageDetailsView: UIView!
    @IBOutlet weak var userDetailsView: UIView!
    @IBOutlet weak var lastLoginLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var addreeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var packageLabel: UILabel!
    @IBOutlet weak var regDateLabel: UILabel!
    
    @IBOutlet weak var nextDueLabel: UILabel!
    
    @IBOutlet weak var billingCycleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupView()
        // Do any additional setup after loading the view.
    }

    func setupView(){
        packageDetailsView.layer.shadowColor = UIColor.black.cgColor
        packageDetailsView.layer.shadowOpacity = 0.5
        packageDetailsView.layer.shadowOffset = CGSize.zero
        packageDetailsView.layer.shadowRadius = 4
        packageDetailsView.layer.shadowPath = UIBezierPath(rect: packageDetailsView.bounds).cgPath
        
        userDetailsView.layer.shadowColor = UIColor.black.cgColor
        userDetailsView.layer.shadowOpacity = 0.5
        userDetailsView.layer.shadowOffset = CGSize.zero
        userDetailsView.layer.shadowRadius = 4
        
        
        userDetailsView.layer.shadowPath = UIBezierPath(rect: userDetailsView.bounds).cgPath
        nameLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.fullname
        emailLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.email
        stateLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.state
        
        addreeLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.address1
        countryLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.country
        postalCodeLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.postcode
        lastLoginLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.lastlogin
        
//        regDateLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.products?.product.da
//        countryLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.country
//        postalCodeLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.postcode
//        lastLoginLabel.text = AuthenticationManager.sharedInstance.clinetInformation?.client?.lastlogin
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
