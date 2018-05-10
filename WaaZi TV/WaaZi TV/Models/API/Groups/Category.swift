
import Foundation
 

public class Category {
	public var title : String?
	public var description : String?
	public var feed_url : String?
	public var hd_image : String?
	public var sd_image : String?
	public var feed_type : String?
    public var id : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let category_list = Category.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Category Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Category]
    {
        var models:[Category] = []
        for item in array
        {
            models.append(Category(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let category = Category(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Category Instance.
*/
	required public init?(dictionary: NSDictionary) {
        id = dictionary["id"] as? String
		title = dictionary["title"] as? String
		description = dictionary["description"] as? String
		feed_url = dictionary["feed_url"] as? String
		hd_image = dictionary["hd_image"] as? String
		sd_image = dictionary["sd_image"] as? String
		feed_type = dictionary["feed_type"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.feed_url, forKey: "feed_url")
		dictionary.setValue(self.hd_image, forKey: "hd_image")
		dictionary.setValue(self.sd_image, forKey: "sd_image")
		dictionary.setValue(self.feed_type, forKey: "feed_type")

		return dictionary
	}

}
