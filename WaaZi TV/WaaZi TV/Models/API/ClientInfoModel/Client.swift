/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Client {
	public var userid : Int?
	public var id : Int?
	public var uuid : String?
	public var firstname : String?
	public var lastname : String?
	public var fullname : String?
	public var companyname : String?
	public var email : String?
	public var address1 : String?
	public var address2 : String?
	public var city : String?
	public var fullstate : String?
	public var state : String?
	public var postcode : String?
	public var countrycode : String?
	public var country : String?
	public var phonenumber : String?
	public var statecode : String?
	public var countryname : String?
	public var phonecc : Int?
	public var phonenumberformatted : String?
	public var billingcid : Int?
	public var notes : String?
	public var twofaenabled : Bool?
	public var currency : Int?
	public var defaultgateway : String?
	public var gatewayid : String?
	public var groupid : Int?
	public var status : String?
	public var credit : Double?
	public var taxexempt : Bool?
	public var latefeeoveride : Bool?
	public var overideduenotices : Bool?
	public var separateinvoices : Bool?
	public var disableautocc : Bool?
	public var emailoptout : Bool?
	public var overrideautoclose : Bool?
	public var allowSingleSignOn : Int?
	public var language : String?
	public var lastlogin : String?
	public var currency_code : String?
	public var mac : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let client_list = Client.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Client Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Client]
    {
        var models:[Client] = []
        for item in array
        {
            models.append(Client(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let client = Client(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Client Instance.
*/
	required public init?(dictionary: NSDictionary) {

		userid = dictionary["userid"] as? Int
		id = dictionary["id"] as? Int
		uuid = dictionary["uuid"] as? String
		firstname = dictionary["firstname"] as? String
		lastname = dictionary["lastname"] as? String
		fullname = dictionary["fullname"] as? String
		companyname = dictionary["companyname"] as? String
		email = dictionary["email"] as? String
		address1 = dictionary["address1"] as? String
		address2 = dictionary["address2"] as? String
		city = dictionary["city"] as? String
		fullstate = dictionary["fullstate"] as? String
		state = dictionary["state"] as? String
		postcode = dictionary["postcode"] as? String
		countrycode = dictionary["countrycode"] as? String
		country = dictionary["country"] as? String
		phonenumber = dictionary["phonenumber"] as? String
		statecode = dictionary["statecode"] as? String
		countryname = dictionary["countryname"] as? String
		phonecc = dictionary["phonecc"] as? Int
		phonenumberformatted = dictionary["phonenumberformatted"] as? String
		billingcid = dictionary["billingcid"] as? Int
		notes = dictionary["notes"] as? String
		twofaenabled = dictionary["twofaenabled"] as? Bool
		currency = dictionary["currency"] as? Int
		defaultgateway = dictionary["defaultgateway"] as? String
		gatewayid = dictionary["gatewayid"] as? String
		groupid = dictionary["groupid"] as? Int
		status = dictionary["status"] as? String
		credit = dictionary["credit"] as? Double
		taxexempt = dictionary["taxexempt"] as? Bool
		latefeeoveride = dictionary["latefeeoveride"] as? Bool
		overideduenotices = dictionary["overideduenotices"] as? Bool
		separateinvoices = dictionary["separateinvoices"] as? Bool
		disableautocc = dictionary["disableautocc"] as? Bool
		emailoptout = dictionary["emailoptout"] as? Bool
		overrideautoclose = dictionary["overrideautoclose"] as? Bool
		allowSingleSignOn = dictionary["allowSingleSignOn"] as? Int
		language = dictionary["language"] as? String
		lastlogin = dictionary["lastlogin"] as? String
		currency_code = dictionary["currency_code"] as? String
		mac = dictionary["mac"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.userid, forKey: "userid")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.uuid, forKey: "uuid")
		dictionary.setValue(self.firstname, forKey: "firstname")
		dictionary.setValue(self.lastname, forKey: "lastname")
		dictionary.setValue(self.fullname, forKey: "fullname")
		dictionary.setValue(self.companyname, forKey: "companyname")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.address1, forKey: "address1")
		dictionary.setValue(self.address2, forKey: "address2")
		dictionary.setValue(self.city, forKey: "city")
		dictionary.setValue(self.fullstate, forKey: "fullstate")
		dictionary.setValue(self.state, forKey: "state")
		dictionary.setValue(self.postcode, forKey: "postcode")
		dictionary.setValue(self.countrycode, forKey: "countrycode")
		dictionary.setValue(self.country, forKey: "country")
		dictionary.setValue(self.phonenumber, forKey: "phonenumber")
		dictionary.setValue(self.statecode, forKey: "statecode")
		dictionary.setValue(self.countryname, forKey: "countryname")
		dictionary.setValue(self.phonecc, forKey: "phonecc")
		dictionary.setValue(self.phonenumberformatted, forKey: "phonenumberformatted")
		dictionary.setValue(self.billingcid, forKey: "billingcid")
		dictionary.setValue(self.notes, forKey: "notes")
		dictionary.setValue(self.twofaenabled, forKey: "twofaenabled")
		dictionary.setValue(self.currency, forKey: "currency")
		dictionary.setValue(self.defaultgateway, forKey: "defaultgateway")
		dictionary.setValue(self.gatewayid, forKey: "gatewayid")
		dictionary.setValue(self.groupid, forKey: "groupid")
		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.credit, forKey: "credit")
		dictionary.setValue(self.taxexempt, forKey: "taxexempt")
		dictionary.setValue(self.latefeeoveride, forKey: "latefeeoveride")
		dictionary.setValue(self.overideduenotices, forKey: "overideduenotices")
		dictionary.setValue(self.separateinvoices, forKey: "separateinvoices")
		dictionary.setValue(self.disableautocc, forKey: "disableautocc")
		dictionary.setValue(self.emailoptout, forKey: "emailoptout")
		dictionary.setValue(self.overrideautoclose, forKey: "overrideautoclose")
		dictionary.setValue(self.allowSingleSignOn, forKey: "allowSingleSignOn")
		dictionary.setValue(self.language, forKey: "language")
		dictionary.setValue(self.lastlogin, forKey: "lastlogin")
		dictionary.setValue(self.currency_code, forKey: "currency_code")
		dictionary.setValue(self.mac, forKey: "mac")

		return dictionary
	}

}