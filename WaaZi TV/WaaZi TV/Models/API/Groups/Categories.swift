

import Foundation
 

public class Categories {
	public var category : Array<Category>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let categories_list = Categories.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Categories Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Categories]
    {
        var models:[Categories] = []
        for item in array
        {
            models.append(Categories(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let categories = Categories(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Categories Instance.
*/
	required public init?(dictionary: NSDictionary) {

        if (dictionary["category"] != nil) { category = Category.modelsFromDictionaryArray(array: dictionary["category"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()


		return dictionary
	}

}
