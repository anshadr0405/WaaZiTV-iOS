/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Stats {
	public var numdueinvoices : Int?
	public var dueinvoicesbalance : Dueinvoicesbalance?
	public var income : Income?
	public var incredit : Bool?
	public var creditbalance : Creditbalance?
	public var numoverdueinvoices : Int?
	public var overdueinvoicesbalance : Overdueinvoicesbalance?
	public var numDraftInvoices : Int?
	public var draftInvoicesBalance : DraftInvoicesBalance?
	public var numpaidinvoices : Int?
	public var paidinvoicesamount : Paidinvoicesamount?
	public var numunpaidinvoices : Int?
	public var unpaidinvoicesamount : Unpaidinvoicesamount?
	public var numcancelledinvoices : Int?
	public var cancelledinvoicesamount : Cancelledinvoicesamount?
	public var numrefundedinvoices : Int?
	public var refundedinvoicesamount : Refundedinvoicesamount?
	public var numcollectionsinvoices : Int?
	public var collectionsinvoicesamount : Collectionsinvoicesamount?
	public var numpaymentpendinginvoices : Int?
	public var paymentpendinginvoicesamount : Paymentpendinginvoicesamount?
	public var productsnumactivehosting : Int?
	public var productsnumhosting : Int?
	public var productsnumactivereseller : Int?
	public var productsnumreseller : Int?
	public var productsnumactiveservers : Int?
	public var productsnumservers : Int?
	public var productsnumactiveother : Int?
	public var productsnumother : Int?
	public var productsnumactive : Int?
	public var productsnumtotal : Int?
	public var numactivedomains : Int?
	public var numdomains : Int?
	public var numacceptedquotes : Int?
	public var numquotes : Int?
	public var numtickets : Int?
	public var numactivetickets : Int?
	public var numaffiliatesignups : Int?
	public var isAffiliate : Bool?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let stats_list = Stats.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Stats Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Stats]
    {
        var models:[Stats] = []
        for item in array
        {
            models.append(Stats(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let stats = Stats(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Stats Instance.
*/
	required public init?(dictionary: NSDictionary) {

		numdueinvoices = dictionary["numdueinvoices"] as? Int
		if (dictionary["dueinvoicesbalance"] != nil) { dueinvoicesbalance = Dueinvoicesbalance(dictionary: dictionary["dueinvoicesbalance"] as! NSDictionary) }
		if (dictionary["income"] != nil) { income = Income(dictionary: dictionary["income"] as! NSDictionary) }
		incredit = dictionary["incredit"] as? Bool
		if (dictionary["creditbalance"] != nil) { creditbalance = Creditbalance(dictionary: dictionary["creditbalance"] as! NSDictionary) }
		numoverdueinvoices = dictionary["numoverdueinvoices"] as? Int
		if (dictionary["overdueinvoicesbalance"] != nil) { overdueinvoicesbalance = Overdueinvoicesbalance(dictionary: dictionary["overdueinvoicesbalance"] as! NSDictionary) }
		numDraftInvoices = dictionary["numDraftInvoices"] as? Int
		if (dictionary["draftInvoicesBalance"] != nil) { draftInvoicesBalance = DraftInvoicesBalance(dictionary: dictionary["draftInvoicesBalance"] as! NSDictionary) }
		numpaidinvoices = dictionary["numpaidinvoices"] as? Int
		if (dictionary["paidinvoicesamount"] != nil) { paidinvoicesamount = Paidinvoicesamount(dictionary: dictionary["paidinvoicesamount"] as! NSDictionary) }
		numunpaidinvoices = dictionary["numunpaidinvoices"] as? Int
		if (dictionary["unpaidinvoicesamount"] != nil) { unpaidinvoicesamount = Unpaidinvoicesamount(dictionary: dictionary["unpaidinvoicesamount"] as! NSDictionary) }
		numcancelledinvoices = dictionary["numcancelledinvoices"] as? Int
		if (dictionary["cancelledinvoicesamount"] != nil) { cancelledinvoicesamount = Cancelledinvoicesamount(dictionary: dictionary["cancelledinvoicesamount"] as! NSDictionary) }
		numrefundedinvoices = dictionary["numrefundedinvoices"] as? Int
		if (dictionary["refundedinvoicesamount"] != nil) { refundedinvoicesamount = Refundedinvoicesamount(dictionary: dictionary["refundedinvoicesamount"] as! NSDictionary) }
		numcollectionsinvoices = dictionary["numcollectionsinvoices"] as? Int
		if (dictionary["collectionsinvoicesamount"] != nil) { collectionsinvoicesamount = Collectionsinvoicesamount(dictionary: dictionary["collectionsinvoicesamount"] as! NSDictionary) }
		numpaymentpendinginvoices = dictionary["numpaymentpendinginvoices"] as? Int
		if (dictionary["paymentpendinginvoicesamount"] != nil) { paymentpendinginvoicesamount = Paymentpendinginvoicesamount(dictionary: dictionary["paymentpendinginvoicesamount"] as! NSDictionary) }
		productsnumactivehosting = dictionary["productsnumactivehosting"] as? Int
		productsnumhosting = dictionary["productsnumhosting"] as? Int
		productsnumactivereseller = dictionary["productsnumactivereseller"] as? Int
		productsnumreseller = dictionary["productsnumreseller"] as? Int
		productsnumactiveservers = dictionary["productsnumactiveservers"] as? Int
		productsnumservers = dictionary["productsnumservers"] as? Int
		productsnumactiveother = dictionary["productsnumactiveother"] as? Int
		productsnumother = dictionary["productsnumother"] as? Int
		productsnumactive = dictionary["productsnumactive"] as? Int
		productsnumtotal = dictionary["productsnumtotal"] as? Int
		numactivedomains = dictionary["numactivedomains"] as? Int
		numdomains = dictionary["numdomains"] as? Int
		numacceptedquotes = dictionary["numacceptedquotes"] as? Int
		numquotes = dictionary["numquotes"] as? Int
		numtickets = dictionary["numtickets"] as? Int
		numactivetickets = dictionary["numactivetickets"] as? Int
		numaffiliatesignups = dictionary["numaffiliatesignups"] as? Int
		isAffiliate = dictionary["isAffiliate"] as? Bool
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.numdueinvoices, forKey: "numdueinvoices")
		dictionary.setValue(self.dueinvoicesbalance?.dictionaryRepresentation(), forKey: "dueinvoicesbalance")
		dictionary.setValue(self.income?.dictionaryRepresentation(), forKey: "income")
		dictionary.setValue(self.incredit, forKey: "incredit")
		dictionary.setValue(self.creditbalance?.dictionaryRepresentation(), forKey: "creditbalance")
		dictionary.setValue(self.numoverdueinvoices, forKey: "numoverdueinvoices")
		dictionary.setValue(self.overdueinvoicesbalance?.dictionaryRepresentation(), forKey: "overdueinvoicesbalance")
		dictionary.setValue(self.numDraftInvoices, forKey: "numDraftInvoices")
		dictionary.setValue(self.draftInvoicesBalance?.dictionaryRepresentation(), forKey: "draftInvoicesBalance")
		dictionary.setValue(self.numpaidinvoices, forKey: "numpaidinvoices")
		dictionary.setValue(self.paidinvoicesamount?.dictionaryRepresentation(), forKey: "paidinvoicesamount")
		dictionary.setValue(self.numunpaidinvoices, forKey: "numunpaidinvoices")
		dictionary.setValue(self.unpaidinvoicesamount?.dictionaryRepresentation(), forKey: "unpaidinvoicesamount")
		dictionary.setValue(self.numcancelledinvoices, forKey: "numcancelledinvoices")
		dictionary.setValue(self.cancelledinvoicesamount?.dictionaryRepresentation(), forKey: "cancelledinvoicesamount")
		dictionary.setValue(self.numrefundedinvoices, forKey: "numrefundedinvoices")
		dictionary.setValue(self.refundedinvoicesamount?.dictionaryRepresentation(), forKey: "refundedinvoicesamount")
		dictionary.setValue(self.numcollectionsinvoices, forKey: "numcollectionsinvoices")
		dictionary.setValue(self.collectionsinvoicesamount?.dictionaryRepresentation(), forKey: "collectionsinvoicesamount")
		dictionary.setValue(self.numpaymentpendinginvoices, forKey: "numpaymentpendinginvoices")
		dictionary.setValue(self.paymentpendinginvoicesamount?.dictionaryRepresentation(), forKey: "paymentpendinginvoicesamount")
		dictionary.setValue(self.productsnumactivehosting, forKey: "productsnumactivehosting")
		dictionary.setValue(self.productsnumhosting, forKey: "productsnumhosting")
		dictionary.setValue(self.productsnumactivereseller, forKey: "productsnumactivereseller")
		dictionary.setValue(self.productsnumreseller, forKey: "productsnumreseller")
		dictionary.setValue(self.productsnumactiveservers, forKey: "productsnumactiveservers")
		dictionary.setValue(self.productsnumservers, forKey: "productsnumservers")
		dictionary.setValue(self.productsnumactiveother, forKey: "productsnumactiveother")
		dictionary.setValue(self.productsnumother, forKey: "productsnumother")
		dictionary.setValue(self.productsnumactive, forKey: "productsnumactive")
		dictionary.setValue(self.productsnumtotal, forKey: "productsnumtotal")
		dictionary.setValue(self.numactivedomains, forKey: "numactivedomains")
		dictionary.setValue(self.numdomains, forKey: "numdomains")
		dictionary.setValue(self.numacceptedquotes, forKey: "numacceptedquotes")
		dictionary.setValue(self.numquotes, forKey: "numquotes")
		dictionary.setValue(self.numtickets, forKey: "numtickets")
		dictionary.setValue(self.numactivetickets, forKey: "numactivetickets")
		dictionary.setValue(self.numaffiliatesignups, forKey: "numaffiliatesignups")
		dictionary.setValue(self.isAffiliate, forKey: "isAffiliate")

		return dictionary
	}

}