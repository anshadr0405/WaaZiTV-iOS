
import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ChannelsResponseModel {
	public var categories : ChannelCategories?

/**
    Returns an array of models based on given dictionary.
    


    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ChannelsResponseModel]
    {
        var models:[ChannelsResponseModel] = []
        for item in array
        {
            models.append(ChannelsResponseModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		if (dictionary["categories"] != nil) { categories = ChannelCategories(dictionary: dictionary["categories"] as! NSDictionary) }
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
