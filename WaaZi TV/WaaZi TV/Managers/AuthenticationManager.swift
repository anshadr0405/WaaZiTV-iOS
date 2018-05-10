//
//  AuthenticationManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 07/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
class AuthenticationManager: BaseManager {
      static let sharedInstance = AuthenticationManager()
    
    func userAuthentiationService(completion:@escaping Completion){
        completion(.loading, nil, nil)
        let params = NetworkUtils.getCommonUrlParams(type: .authenticate)
        
        let config = ServiceConfig.appConfig()
        let authenticationService:Service = Service(config!)
        let authRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        authenticationService.execute(authRequest, retry: 5).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            let apiResponse = ApiResponse.init(dictionary:responseDict as NSDictionary)
            if (apiResponse?.boxapi?.result == "true"){
                DispatchQueue.main.async {
                    completion(.success, apiResponse as AnyObject, nil)
                    
                }
            }
            else if (apiResponse?.boxapi?.result == "false"){
                
                DispatchQueue.main.async {
                    completion(.error, nil, apiResponse?.boxapi?.message)
                    
                }
            }
            
        }).catch({ err in
            
            DispatchQueue.main.async {
                completion(.error,nil,err.localizedDescription )
                
            }
            
        })
    }
    
}
