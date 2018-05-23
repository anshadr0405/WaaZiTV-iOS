//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Hydra

/// Service is a concrete implementation of the ServiceProtocol
public class Service: ServiceProtocol {

	/// Configuration
	public var configuration: ServiceConfig
	
	/// Session headers
	public var headers: HeadersDict
	
	/// Initialize a new service with given configuration
	///
	/// - Parameter configuration: configuration. If `nil` is passed attempt to load configuration from your app's Info.plist
	public required init(_ configuration: ServiceConfig) {
		self.configuration = configuration
		self.headers = self.configuration.headers // fillup with initial headers
	}
	
	/// Execute a request and return a promise with the response
	///
	/// - Parameters:
	///   - request: request to execute
	///   - retry: retry attempts. If `nil` only one attempt is made. Default value is `nil`.
	/// - Returns: Promise
	/// - Throws: throw an exception if operation cannot be executed
	public func execute(_ request: RequestProtocol, retry: Int?) -> Promise<ResponseProtocol> {
		// Wrap in a promise the request itself
		let op = Promise<ResponseProtocol>(in: request.context ?? .background, token: request.invalidationToken, { (r, rj, s) in
			// Attempt to create the object to perform request
          //  WTUtils.printToConsole(message: try! request.urlRequest(in: self) as! String)
            try WTUtils.printToConsole(message: "Request : \(request.urlRequest(in: self))")
			let dataOperation: DataRequest = try Alamofire.request(request.urlRequest(in: self))

			// Execute operation in Alamofire
			dataOperation.response(completionHandler: { rData in
				// Parse response
				let parsedResponse = Response(afResponse: rData, request: request)
				switch parsedResponse.type {
				case .success: // success
					r(parsedResponse)
                    WTUtils.printToConsole(message: parsedResponse.toString()!)
				case .error: // failure
					rj(NetworkError.error(parsedResponse))
                    WTUtils.printToConsole(message: parsedResponse.toString()!)
				case .noResponse:  // no response
					rj(NetworkError.noResponse(parsedResponse))
                    WTUtils.printToConsole(message: parsedResponse.toString()!)
				}
			})
		})
		guard let retryAttempts = retry else { return op } // single shot
		return op.retry(retryAttempts) // retry n times
	}
	
}
