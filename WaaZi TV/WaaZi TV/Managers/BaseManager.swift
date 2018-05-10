//
//  BaseManager.swift
//  WaaZi TV
//
//  Created by Akhil P.K on 05/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
class BaseManager {
     let serviceConfig = ServiceConfig.appConfig()
    public enum Status: String {
        case success    =    "success"
        case error        =    "error"
        case loading    =    "loading"
        
    }
    typealias Completion = (_ status:Status,_ data:AnyObject?,_ errorMessage:String?) -> Void
    
}
