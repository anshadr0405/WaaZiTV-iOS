/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Product {
	public var id : Int?
	public var clientid : Int?
	public var orderid : Int?
	public var pid : Int?
	public var regdate : String?
	public var name : String?
	public var translated_name : String?
	public var groupname : String?
	public var translated_groupname : String?
	public var domain : String?
	public var dedicatedip : String?
	public var serverid : Int?
	public var servername : String?
	public var serverip : String?
	public var serverhostname : String?
	public var suspensionreason : String?
	public var firstpaymentamount : Double?
	public var recurringamount : Double?
	public var paymentmethod : String?
	public var paymentmethodname : String?
	public var billingcycle : String?
	public var nextduedate : String?
	public var status : String?
	public var username : Int?
	public var password : Int?
	public var subscriptionid : String?
	public var promoid : Int?
	public var overideautosuspend : Int?
	public var overidesuspenduntil : String?
	public var ns1 : String?
	public var ns2 : String?
	public var assignedips : String?
	public var notes : String?
	public var diskusage : Int?
	public var disklimit : Int?
	public var bwusage : Int?
	public var bwlimit : Int?
	public var lastupdate : String?
	public var customfields : Customfields?
	public var configoptions : Configoptions?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let product_list = Product.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Product Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Product]
    {
        var models:[Product] = []
        for item in array
        {
            models.append(Product(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let product = Product(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Product Instance.
*/
	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
		clientid = dictionary["clientid"] as? Int
		orderid = dictionary["orderid"] as? Int
		pid = dictionary["pid"] as? Int
		regdate = dictionary["regdate"] as? String
		name = dictionary["name"] as? String
		translated_name = dictionary["translated_name"] as? String
		groupname = dictionary["groupname"] as? String
		translated_groupname = dictionary["translated_groupname"] as? String
		domain = dictionary["domain"] as? String
		dedicatedip = dictionary["dedicatedip"] as? String
		serverid = dictionary["serverid"] as? Int
		servername = dictionary["servername"] as? String
		serverip = dictionary["serverip"] as? String
		serverhostname = dictionary["serverhostname"] as? String
		suspensionreason = dictionary["suspensionreason"] as? String
		firstpaymentamount = dictionary["firstpaymentamount"] as? Double
		recurringamount = dictionary["recurringamount"] as? Double
		paymentmethod = dictionary["paymentmethod"] as? String
		paymentmethodname = dictionary["paymentmethodname"] as? String
		billingcycle = dictionary["billingcycle"] as? String
		nextduedate = dictionary["nextduedate"] as? String
		status = dictionary["status"] as? String
		username = dictionary["username"] as? Int
		password = dictionary["password"] as? Int
		subscriptionid = dictionary["subscriptionid"] as? String
		promoid = dictionary["promoid"] as? Int
		overideautosuspend = dictionary["overideautosuspend"] as? Int
		overidesuspenduntil = dictionary["overidesuspenduntil"] as? String
		ns1 = dictionary["ns1"] as? String
		ns2 = dictionary["ns2"] as? String
		assignedips = dictionary["assignedips"] as? String
		notes = dictionary["notes"] as? String
		diskusage = dictionary["diskusage"] as? Int
		disklimit = dictionary["disklimit"] as? Int
		bwusage = dictionary["bwusage"] as? Int
		bwlimit = dictionary["bwlimit"] as? Int
		lastupdate = dictionary["lastupdate"] as? String
		if (dictionary["customfields"] != nil) { customfields = Customfields(dictionary: dictionary["customfields"] as! NSDictionary) }
		if (dictionary["configoptions"] != nil) { configoptions = Configoptions(dictionary: dictionary["configoptions"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.clientid, forKey: "clientid")
		dictionary.setValue(self.orderid, forKey: "orderid")
		dictionary.setValue(self.pid, forKey: "pid")
		dictionary.setValue(self.regdate, forKey: "regdate")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.translated_name, forKey: "translated_name")
		dictionary.setValue(self.groupname, forKey: "groupname")
		dictionary.setValue(self.translated_groupname, forKey: "translated_groupname")
		dictionary.setValue(self.domain, forKey: "domain")
		dictionary.setValue(self.dedicatedip, forKey: "dedicatedip")
		dictionary.setValue(self.serverid, forKey: "serverid")
		dictionary.setValue(self.servername, forKey: "servername")
		dictionary.setValue(self.serverip, forKey: "serverip")
		dictionary.setValue(self.serverhostname, forKey: "serverhostname")
		dictionary.setValue(self.suspensionreason, forKey: "suspensionreason")
		dictionary.setValue(self.firstpaymentamount, forKey: "firstpaymentamount")
		dictionary.setValue(self.recurringamount, forKey: "recurringamount")
		dictionary.setValue(self.paymentmethod, forKey: "paymentmethod")
		dictionary.setValue(self.paymentmethodname, forKey: "paymentmethodname")
		dictionary.setValue(self.billingcycle, forKey: "billingcycle")
		dictionary.setValue(self.nextduedate, forKey: "nextduedate")
		dictionary.setValue(self.status, forKey: "status")
		dictionary.setValue(self.username, forKey: "username")
		dictionary.setValue(self.password, forKey: "password")
		dictionary.setValue(self.subscriptionid, forKey: "subscriptionid")
		dictionary.setValue(self.promoid, forKey: "promoid")
		dictionary.setValue(self.overideautosuspend, forKey: "overideautosuspend")
		dictionary.setValue(self.overidesuspenduntil, forKey: "overidesuspenduntil")
		dictionary.setValue(self.ns1, forKey: "ns1")
		dictionary.setValue(self.ns2, forKey: "ns2")
		dictionary.setValue(self.assignedips, forKey: "assignedips")
		dictionary.setValue(self.notes, forKey: "notes")
		dictionary.setValue(self.diskusage, forKey: "diskusage")
		dictionary.setValue(self.disklimit, forKey: "disklimit")
		dictionary.setValue(self.bwusage, forKey: "bwusage")
		dictionary.setValue(self.bwlimit, forKey: "bwlimit")
		dictionary.setValue(self.lastupdate, forKey: "lastupdate")
		dictionary.setValue(self.customfields?.dictionaryRepresentation(), forKey: "customfields")
		dictionary.setValue(self.configoptions?.dictionaryRepresentation(), forKey: "configoptions")

		return dictionary
	}

}