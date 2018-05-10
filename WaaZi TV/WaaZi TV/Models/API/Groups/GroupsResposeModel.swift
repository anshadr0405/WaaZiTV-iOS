

import Foundation
 

public class GroupsResposeModel{
	public var categories : Categories?

/**
    Returns an array of models based on given dictionary.
    
   

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [GroupsResposeModel]
    {
        var models:[GroupsResposeModel] = []
        for item in array
        {
            models.append(GroupsResposeModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
  

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["categories"] != nil) { categories = Categories(dictionary: dictionary["categories"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.categories?.dictionaryRepresentation(), forKey: "categories")

		return dictionary
	}

}
