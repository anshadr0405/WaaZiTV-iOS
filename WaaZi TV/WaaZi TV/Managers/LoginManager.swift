//
//  LoginManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 05/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

class LoginManager :BaseManager {
    static let sharedInstance = LoginManager()
    func registerUser(loginType:LoginType,userName:String,passWord:String,completion:@escaping Completion){
        completion(.loading, nil, nil)

        let params = NetworkUtils.getCommonUrlParams(type: .register)
        switch loginType {
        case .Email:
         params.setValue(userName, forKey: "email")
         params.setValue(passWord, forKey: "password")
            break
        case .Username:
            params.setValue(userName, forKey: "username")
            params.setValue(passWord, forKey: "password")

            break
        case .VoucherCode:
            params.setValue(passWord, forKey: "voucher")
            break
        case .None:
            break
        }
        
        let config = ServiceConfig.appConfig()
        let loginService:Service = Service(config!)
        let loginRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        loginService.execute(loginRequest, retry: 0).then( { response in
            
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            let apiResponse = ApiResponse.init(dictionary:responseDict as NSDictionary)
            if (apiResponse?.boxapi?.result == "success" || apiResponse?.boxapi?.result == "true"){
                completion(.success, apiResponse as AnyObject, nil)
            }
            else if (apiResponse?.boxapi?.result == "error"){
                completion(.error, nil, apiResponse?.boxapi?.message)
            }
            
        }).catch({ err in
            completion(.error,nil,err.localizedDescription )

        })
        
    }

    
}
