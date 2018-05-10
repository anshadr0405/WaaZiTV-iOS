/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class ChannelCategory {
	public var id : String?
	public var title : String?
	public var description : String?
	public var program_name : String?
	public var program_description : String?
	public var channelnumber : Int?
	public var childlock : Int?
	public var feed_type : String?
	public var playback_type : String?
	public var feed_url : String?
	public var hd_image : String?
	public var sd_image : String?
	public var hls_url : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let category_list = Category.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Category Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ChannelCategory]
    {
        var models:[ChannelCategory] = []
        for item in array
        {
            models.append(ChannelCategory(dictionary: item as! NSDictionary)!)
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
		program_name = dictionary["program_name"] as? String
		program_description = dictionary["program_description"] as? String
		channelnumber = dictionary["channelnumber"] as? Int
		childlock = dictionary["childlock"] as? Int
		feed_type = dictionary["feed_type"] as? String
		playback_type = dictionary["playback_type"] as? String
		feed_url = dictionary["feed_url"] as? String
		hd_image = dictionary["hd_image"] as? String
		sd_image = dictionary["sd_image"] as? String
		hls_url = dictionary["hls_url"] as? String
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
		dictionary.setValue(self.program_name, forKey: "program_name")
		dictionary.setValue(self.program_description, forKey: "program_description")
		dictionary.setValue(self.channelnumber, forKey: "channelnumber")
		dictionary.setValue(self.childlock, forKey: "childlock")
		dictionary.setValue(self.feed_type, forKey: "feed_type")
		dictionary.setValue(self.playback_type, forKey: "playback_type")
		dictionary.setValue(self.feed_url, forKey: "feed_url")
		dictionary.setValue(self.hd_image, forKey: "hd_image")
		dictionary.setValue(self.sd_image, forKey: "sd_image")
		dictionary.setValue(self.hls_url, forKey: "hls_url")

		return dictionary
	}

}
