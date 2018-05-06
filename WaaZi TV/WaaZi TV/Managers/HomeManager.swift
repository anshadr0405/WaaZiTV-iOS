//
//  HomeManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 06/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
class HomeManager:BaseManager{
    static let sharedInstance = HomeManager()
    var LiveTVCategories : [Category]?
    
    func userAuthentiationService(completion:@escaping Completion){
        completion(.loading, nil, nil)
      let params = NetworkUtils.getCommonUrlParams(type: .authenticate)
        
        let config = ServiceConfig.appConfig()
        let authenticationService:Service = Service(config!)
        let authRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        authenticationService.execute(authRequest, retry: 2).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            let apiResponse = ApiResponse.init(dictionary:responseDict as NSDictionary)
            if (apiResponse?.boxapi?.result == "true"){
                completion(.success, apiResponse as AnyObject, nil)
            }
            else if (apiResponse?.boxapi?.result == "false"){
                completion(.error, nil, apiResponse?.boxapi?.message)
            }
            
        }).catch({ err in
            completion(.error,nil,err.localizedDescription )
            
        })
    }
    
    
    func getGroupsService(completion:@escaping Completion){
        completion(.loading, nil, nil)
        let params = NetworkUtils.getCommonUrlParams(type: .groups)
        let config = ServiceConfig.appConfig()
        let getGroupsService:Service = Service(config!)
        let getGroupsRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        getGroupsService.execute(getGroupsRequest, retry: 2).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            if let groupsResponseModel = GroupsResposeModel.init(dictionary:responseDict as NSDictionary){
                self.LiveTVCategories = groupsResponseModel.categories?.category
                completion(.success, groupsResponseModel as AnyObject, nil)
            }
            else{
                let apiResponse = Boxapi.init(dictionary:responseDict as NSDictionary)
                if (apiResponse?.result == "error"){
                    completion(.error, nil, apiResponse?.message)
                }
            }
         
            
        }).catch({ err in
            completion(.error,nil,err.localizedDescription )
            
        })
    }
    
    
}
