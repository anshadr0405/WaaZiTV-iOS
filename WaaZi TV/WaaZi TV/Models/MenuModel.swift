
import Foundation
 

public class MenuModel :NSObject, NSCoding {
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: CodingKeys.id.rawValue)
        aCoder.encode(self.title, forKey: CodingKeys.title.rawValue);
        aCoder.encode(self.image, forKey: CodingKeys.image.rawValue);
        aCoder.encode(self.destination_id, forKey: CodingKeys.destination_id.rawValue);

    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
        case image = "image"
        case destination_id = "destination_id"

    }
    
	public var id : Int?
	public var title : String?
	public var image : String?
    public var destination_id : String?

	

    public class func modelsFromDictionaryArray(array:NSArray) -> [MenuModel]
    {
        var models:[MenuModel] = []
        for item in array
        {
            models.append(MenuModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }


	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
		title = dictionary["title"] as? String
		image = dictionary["image"] as? String
        destination_id = dictionary["destination_id"] as? String

	}

		

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.image, forKey: "image")
        dictionary.setValue(self.destination_id, forKey: "destination_id")


		return dictionary
	}
    
    
    required public init?(coder aDecoder: NSCoder) {
    
    self.id = aDecoder.decodeObject(forKey: CodingKeys.id.rawValue) as? Int
    self.title = aDecoder.decodeObject(forKey: CodingKeys.title.rawValue) as? String
    self.destination_id = aDecoder.decodeObject(forKey: CodingKeys.destination_id.rawValue) as? String

    self.image = aDecoder.decodeObject(forKey: CodingKeys.image.rawValue) as? String

    }

}
