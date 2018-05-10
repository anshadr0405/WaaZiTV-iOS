/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class AppAttributes {
	public var fingerprint : Bool?
	public var watermark : Bool?
	public var watermarktype : String?
	public var watermarklogo : String?
	public var epg : Bool?
	public var pubid : String?
	public var watermarktext : String?
	public var showads : Bool?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let @attributes_list = @attributes.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of @attributes Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [AppAttributes]
    {
        var models:[AppAttributes] = []
        for item in array
        {
            models.append(AppAttributes(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let @attributes = @attributes(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: @attributes Instance.
*/
	required public init?(dictionary: NSDictionary) {

		fingerprint = dictionary["fingerprint"] as? Bool
		watermark = dictionary["watermark"] as? Bool
		watermarktype = dictionary["watermarktype"] as? String
		watermarklogo = dictionary["watermarklogo"] as? String
		epg = dictionary["epg"] as? Bool
		pubid = dictionary["pubid"] as? String
		watermarktext = dictionary["watermarktext"] as? String
		showads = dictionary["showads"] as? Bool
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.fingerprint, forKey: "fingerprint")
		dictionary.setValue(self.watermark, forKey: "watermark")
		dictionary.setValue(self.watermarktype, forKey: "watermarktype")
		dictionary.setValue(self.watermarklogo, forKey: "watermarklogo")
		dictionary.setValue(self.epg, forKey: "epg")
		dictionary.setValue(self.pubid, forKey: "pubid")
		dictionary.setValue(self.watermarktext, forKey: "watermarktext")
		dictionary.setValue(self.showads, forKey: "showads")

		return dictionary
	}

}
