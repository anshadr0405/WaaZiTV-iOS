
import Foundation
public class ApiResponse  {
    public var boxapi : Boxapi?
    
    /**
     Returns an array of models based on given dictionary.
     
  
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [ApiResponse]
    {
        var models:[ApiResponse] = []
        for item in array
        {
            models.append(ApiResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
    
     */
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["boxapi"] != nil) { boxapi = Boxapi(dictionary: dictionary["boxapi"] as! NSDictionary) }
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.boxapi?.dictionaryRepresentation(), forKey: "boxapi")
        
        return dictionary
    }

}
