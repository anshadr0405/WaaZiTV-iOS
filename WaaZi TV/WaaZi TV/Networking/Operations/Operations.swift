//  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import SwiftyJSON
import Hydra

/// Data operation, return a response via Promise
open class DataOperation<ResponseProtocol>: OperationProtocol {
	typealias T = ResponseProtocol
	
	/// Request to send
	public var request: RequestProtocol?
	
	/// Init
	public init() { }
	
	/// Execute the request in a service and return a promise with server response
	///
	/// - Parameters:
	///   - service: service to use
	///   - retry: retry attempts in case of failure
	/// - Returns: Promise
	public func execute(in service: ServiceProtocol, retry: Int? = nil) -> Promise<ResponseProtocol> {
		return Promise<ResponseProtocol>({ (r, rj, s) in
			guard let rq = self.request else { // missing request
				rj(NetworkError.missingEndpoint)
				return
			}
			// execute the request
			service.execute(rq, retry: retry).then({ dataResponse in
				let x: ResponseProtocol = dataResponse as! ResponseProtocol
				r(x)
			}).catch(rj)
		})
	}
}


/// JSON Operation, return a response as JSON
open class JSONOperation<Output>: OperationProtocol {
	
	typealias T = Output
	
	/// Request
	public var request: RequestProtocol?
	
	/// Implement this function to provide a parsing from raw JSON to `Output`
	public var onParseResponse: ((JSON) throws -> (Output))? = nil
	
	/// Init
	public init() {
		self.onParseResponse = { _ in
			fatalError("You must implement a `onParseResponse` to return your <Output> from JSONOperation")
		}
	}
	
	/// Execute a request and return your specified model `Output`.
	///
	/// - Parameters:
	///   - service: service to use
	///   - retry: retry attempts
	/// - Returns: Promise
	public func execute(in service: ServiceProtocol, retry: Int? = nil) -> Promise<Output> {
		return Promise<Output>({ (r, rj, s) in
			guard let rq = self.request else { // missing request
				rj(NetworkError.missingEndpoint)
				return
			}
			// execute the request
			service.execute(rq, retry: retry).then({ response in
				let json = response.toJSON() // parse json response
				do {
					// Attempt to call custom parsing. Your own class must implement it.
					let parsedObj = try self.onParseResponse!(json)
					r(parsedObj)
				} catch {
					throw NetworkError.failedToParseJSON(json,response)
				}
			}).catch(rj)
		})
	}
}

