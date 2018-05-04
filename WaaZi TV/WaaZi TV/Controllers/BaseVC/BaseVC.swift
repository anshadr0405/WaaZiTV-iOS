//
//  BaseVC.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    let validator = Validator()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigate(identifier:String) {
     let destinationVC:BaseVC = self.storyboard?.instantiateViewController(withIdentifier: identifier) as! BaseVC
            self.navigationController?.pushViewController(destinationVC, animated: true)

    }
}
