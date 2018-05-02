////  WaaZi TV
//
//  Created by Akhil P.K on 02/05/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import Hydra

/// Operation Protocol
protocol OperationProtocol {
	associatedtype T
	
	/// Request
	var request: RequestProtocol? { get set }
		
	/// Execute an operation into specified service
	///
	/// - Parameters:
	///   - service: service to use
	///   - retry: retry attempts
	/// - Returns: Promise
	func execute(in service: ServiceProtocol, retry: Int?) -> Promise<T>
	
}
