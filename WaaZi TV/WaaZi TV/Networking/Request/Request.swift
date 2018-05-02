//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import Hydra
import SwiftyJSON

public class Request: RequestProtocol {
	public var context: Context?
	
	/// Invalidation token to cancel the request
	public var invalidationToken: InvalidationToken?
	
	/// Endpoint for request
	public var endpoint: String
	
	/// Body of the request
	public var body: RequestBody?
	
	/// HTTP method of the request
	public var method: RequestMethod?
	
	/// Fields of the request
	public var fields: ParametersDict?
	
	/// URL of the request
	public var urlParams: ParametersDict?
	
	/// Headers of the request
	public var headers: HeadersDict?
	
	/// Cache policy
	public var cachePolicy: URLRequest.CachePolicy?
	
	/// Timeout of the request
	public var timeout: TimeInterval?
	
	/// Initialize a new request
	///
	/// - Parameters:
	///   - method: HTTP Method request (if not specified, `.get` is used)
	///   - endpoint: endpoint of the request
	///   - params: paramters to replace in endpoint
	///   - fields: fields to append inside the url
	///   - body: body to set
	public init(method: RequestMethod = .get, endpoint: String = "", params: ParametersDict? = nil, fields: ParametersDict? = nil, body: RequestBody? = nil) {
		self.method = method
		self.endpoint = endpoint
		self.urlParams = params
		self.fields = fields
		self.body = body
	}
}
