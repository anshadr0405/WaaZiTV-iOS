//
//  WTUtils.swift
//  WaaZi TV
//
//  Created by anshad on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Foundation
import Security
class WTUtils: NSObject {
   public static func getMenuJsonArrayWithFileName(filename:String) -> [MenuModel]{
    var dataDict:NSDictionary = NSDictionary()
        let path = Bundle.main.path(forResource: filename, ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
            dataDict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
            
            
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
        return MenuModel.modelsFromDictionaryArray(array: dataDict[filename]as! NSArray)
    }
  
    public static func getUUID() ->String{
        let accountName = "WaaziTVUser"
        let keychain = Keychain(service: "WaaziTV")
        var applicationUUID = keychain[accountName]
        
        if applicationUUID == nil {
            
            applicationUUID = UIDevice.current.identifierForVendor?.uuidString
            
            // Save applicationUUID in keychain without synchronization
            do {
                try keychain.set(applicationUUID!, key: applicationUUID!)
            }
            catch let error {
                print(error)
            }
            
        }
        return applicationUUID!
    }
        static func printToConsole(file:String = #file,functionName: String = #function, message:String) {
        
            
            let urlStr : NSString = file.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! as NSString
            print("\n \(NSURL(string: urlStr as String)!.lastPathComponent!)::\(functionName)::\(message) \n")
        }
        
    
}
