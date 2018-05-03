//
//  WTUtils.swift
//  WaaZi TV
//
//  Created by anshad on 03/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

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
}
