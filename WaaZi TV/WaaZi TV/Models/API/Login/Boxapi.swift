

import Foundation
public class Boxapi  {
    public var result : String?
    public var message : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let boxapi_list = Boxapi.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Boxapi Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Boxapi]
    {
        var models:[Boxapi] = []
        for item in array
        {
            models.append(Boxapi(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let boxapi = Boxapi(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Boxapi Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        result = dictionary["result"] as? String
        message = dictionary["message"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.result, forKey: "result")
        dictionary.setValue(self.message, forKey: "message")
        
        return dictionary
    }

}
