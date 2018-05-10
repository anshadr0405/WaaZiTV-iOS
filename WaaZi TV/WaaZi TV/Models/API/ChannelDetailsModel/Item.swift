/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Item {
	public var title : String?
	public var description : String?
	public var program_name : String?
	public var program_description : String?
	public var channelnumber : Int?
	public var childlock : Int?
	public var hd_image : String?
	public var sd_image : String?
	public var hls_url : String?
	public var runtime : String?
	public var contentId : String?
	public var contentType : String?
	public var contentQuality : String?
	public var streamFormat : String?
	public var playback_type : String?
	public var media : Media?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let item_list = Item.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Item Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Item]
    {
        var models:[Item] = []
        for item in array
        {
            models.append(Item(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let item = Item(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Item Instance.
*/
	required public init?(dictionary: NSDictionary) {

		title = dictionary["title"] as? String
		description = dictionary["description"] as? String
		program_name = dictionary["program_name"] as? String
		program_description = dictionary["program_description"] as? String
		channelnumber = dictionary["channelnumber"] as? Int
		childlock = dictionary["childlock"] as? Int
		hd_image = dictionary["hd_image"] as? String
		sd_image = dictionary["sd_image"] as? String
		hls_url = dictionary["hls_url"] as? String
		runtime = dictionary["runtime"] as? String
		contentId = dictionary["contentId"] as? String
		contentType = dictionary["contentType"] as? String
		contentQuality = dictionary["contentQuality"] as? String
		streamFormat = dictionary["streamFormat"] as? String
		playback_type = dictionary["playback_type"] as? String
		if (dictionary["media"] != nil) { media = Media(dictionary: dictionary["media"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.program_name, forKey: "program_name")
		dictionary.setValue(self.program_description, forKey: "program_description")
		dictionary.setValue(self.channelnumber, forKey: "channelnumber")
		dictionary.setValue(self.childlock, forKey: "childlock")
		dictionary.setValue(self.hd_image, forKey: "hd_image")
		dictionary.setValue(self.sd_image, forKey: "sd_image")
		dictionary.setValue(self.hls_url, forKey: "hls_url")
		dictionary.setValue(self.runtime, forKey: "runtime")
		dictionary.setValue(self.contentId, forKey: "contentId")
		dictionary.setValue(self.contentType, forKey: "contentType")
		dictionary.setValue(self.contentQuality, forKey: "contentQuality")
		dictionary.setValue(self.streamFormat, forKey: "streamFormat")
		dictionary.setValue(self.playback_type, forKey: "playback_type")
		dictionary.setValue(self.media?.dictionaryRepresentation(), forKey: "media")

		return dictionary
	}

}