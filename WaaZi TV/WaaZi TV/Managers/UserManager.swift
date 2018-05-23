//
//  UserManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 23/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class UserManager: BaseManager {
    static let sharedInstance = UserManager()
     var user:Client?
     var isUserLoggedIn:Bool?
     var clinetInformation:ClientInfoModel?
    var defaults:UserDefaults = UserDefaults.standard
    func getClientInfoService(completion:@escaping Completion){
        completion(.loading, nil, nil)
        let params = NetworkUtils.getCommonUrlParams(type: .getclientinfo)
        
        let config = ServiceConfig.appConfig()
        let clientInfoService:Service = Service(config!)
        let clientInfoRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        clientInfoService.execute(clientInfoRequest, retry: 5).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            let apiResponse = ClientInfoModel.init(dictionary:responseDict as NSDictionary)
            
            if (apiResponse?.result == "success"){
                DispatchQueue.main.async {
                    self.clinetInformation = apiResponse
                    completion(.success, apiResponse as AnyObject, nil)
                    
                }
            }
            else {
                
                DispatchQueue.main.async {
                    completion(.error, nil, apiResponse?.message)
                    
                }
            }
            
        }).catch({ err in
            
            DispatchQueue.main.async {
                completion(.error,nil,err.localizedDescription )
                
            }
            
        })
    }
    
    func saveClientInfo()  {
        if self.clinetInformation != nil{
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self.clinetInformation)
            defaults.set(encodedData, forKey: "clientInfo")
             self.isUserLoggedIn = true
              defaults.set(true, forKey: "isUserLoggedIn")
            defaults.synchronize()
          
        }
        
    }
    
    func getisUserLoggedIn() -> Bool {
        return defaults.bool(forKey: "isUserLoggedIn")
    }
    
    
    func getClientInfo()  {
        let decoded  = defaults.object(forKey: "clientInfo") as! Data
        self.clinetInformation = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! ClientInfoModel
        self.user = self.clinetInformation?.client
    }
    
    func clearUserData()  {
            defaults.set(nil, forKey: "clientInfo")
            self.isUserLoggedIn = true
            defaults.set(false, forKey: "isUserLoggedIn")
            defaults.synchronize()
        
    }
    
}
