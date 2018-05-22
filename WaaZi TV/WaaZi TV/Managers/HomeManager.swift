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
                DispatchQueue.main.async {
                   completion(.success, groupsResponseModel as AnyObject, nil)
                    
                }
               
            }
            else{
                let apiResponse = Boxapi.init(dictionary:responseDict as NSDictionary)
                if (apiResponse?.result == "error"){
                    
                    DispatchQueue.main.async {
                        completion(.error, nil, apiResponse?.message)

                    }
                }
            }
         
            
        }).catch({ err in
            
            DispatchQueue.main.async {
                completion(.error,nil,err.localizedDescription )

            }
            
        })
    }
    
    
    func getChannelsService(categoryId:String,completion:@escaping Completion){
        completion(.loading, nil, nil)
        let params = NetworkUtils.getCommonUrlParams(type: .channels)
        if(categoryId != ""){
            params.setValue(categoryId, forKey: "id")
            
        }
        else{
            WTUtils.printToConsole(message: "Category id missing")
        }
       
        let config = ServiceConfig.appConfig()
        let getChannelsService:Service = Service(config!)
        let getChannelsRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        getChannelsService.execute(getChannelsRequest, retry: 2).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            if let channelsResponseModel = ChannelsResponseModel.init(dictionary:responseDict as NSDictionary){
                
                DispatchQueue.main.async {
                    completion(.success, channelsResponseModel as AnyObject, nil)
                }
                
            }
            else{
                let apiResponse = Boxapi.init(dictionary:responseDict as NSDictionary)
                if (apiResponse?.result == "error"){
                    
                    DispatchQueue.main.async {
                        completion(.error, nil, apiResponse?.message)
                        
                    }
                }
            }
            
            
        }).catch({ err in
            
            DispatchQueue.main.async {
                completion(.error,nil,err.localizedDescription )
                
            }
            
        })
    }
    
    func getChannelService(categoryId:String,completion:@escaping Completion){
        completion(.loading, nil, nil)
        let params = NetworkUtils.getCommonUrlParams(type: .channel)
        if(categoryId != ""){
            params.setValue(categoryId, forKey: "id")

        }
        else{
              params.setValue("158", forKey: "id")
        }
        let config = ServiceConfig.appConfig()
        let getChannelService:Service = Service(config!)
        let getChannelRequest:Request = Request(method: .get, endpoint: "", params: nil, fields:params as? ParametersDict , body: nil)
        getChannelService.execute(getChannelRequest, retry: 2).then( { response in
            let responseDict = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
            if let channelDetailsModel = ChannelDetailsModel.init(dictionary:responseDict as NSDictionary){
                DispatchQueue.main.async {
                    completion(.success, channelDetailsModel as AnyObject, nil)
                    
                }
                
            }
            else{
                let apiResponse = Boxapi.init(dictionary:responseDict as NSDictionary)
                if (apiResponse?.result == "error"){
                    
                    DispatchQueue.main.async {
                        completion(.error, nil, apiResponse?.message)
                        
                    }
                }
            }
            
            
        }).catch({ err in
            
            DispatchQueue.main.async {
                completion(.error,nil,err.localizedDescription )
                
            }
            
        })
    }
    
    func searchChannels(_ searchKey:String,_ items:[ChannelCategory]) -> [ChannelCategory] {
        
        var filteredItems = [ChannelCategory]()
        if searchKey.characters.count > 0 {
            //let searchPredicate: NSPredicate = NSPredicate(format: "title contains[cd] %@ || program_name contains[cd] %@" , searchKey, searchKey)
            filteredItems =  items.filter {($0.title?.contains(searchKey))! }

        }
        return filteredItems
    }

}
