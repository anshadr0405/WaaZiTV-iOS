//
//  AlertManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 13/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
typealias SuccessHandler = ((UIAlertAction) -> Void)?
typealias FailureHandler = ((UIAlertAction) -> Void)?

class AlertManager: NSObject {
    static let sharedInstance = AlertManager()

  

    func showAlert(title:String?,message:String,okButtonTitle:String,cancelButtonTitle:String,successHandler:SuccessHandler,failureHadler:FailureHandler,vc:UIViewController) {
          let alertController = UIAlertController.init(title: "WaaZi TV", message:"", preferredStyle: .alert)
        if let titleText = title{
            alertController.title = titleText
        }
        alertController.message = message
        alertController.addAction(UIAlertAction.init(title:okButtonTitle, style: .default, handler: successHandler))
        alertController.addAction(UIAlertAction.init(title:cancelButtonTitle, style: .destructive, handler: failureHadler))
         vc.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title:String?,message:String,successHandler:SuccessHandler,vc:UIViewController) {
          let alertController = UIAlertController.init(title: "WaaZi TV", message:"", preferredStyle: .alert)
        if let titleText = title{
            alertController.title = titleText
        }
        alertController.message = message
          alertController.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: successHandler))
        vc.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(title:String?,message:String,vc:UIViewController) {
          let alertController = UIAlertController.init(title: "WaaZi TV", message:"", preferredStyle: .alert)
        if let titleText = title{
            
            alertController.title = titleText
        }
        alertController.message = message
        alertController.addAction(UIAlertAction.init(title: "Ok", style: .destructive, handler:nil))
        vc.present(alertController, animated: true, completion: nil)

    }

}
