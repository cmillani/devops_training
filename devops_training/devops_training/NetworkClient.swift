//
//  NetworkClient.swift
//  devops_training
//
//  Created by Rodrigo Carvalho da Silva on 27/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
	func resume()
}

protocol URLSessionProtocol {
	func dataTask(
		with request: URLRequest,
		completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
	func dataTask(
		with request: URLRequest,
		completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
		let task = dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
		
		return task
	}
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}

public final class NetworkingClient {
	
	// MARK: - Private Properties
	private var session: URLSessionProtocol
	
	// MARL: - Initializers
	init(session: URLSessionProtocol = URLSession.shared) {
		self.session = session
	}
	
	// MARK: - Public Methods
	
	/// Performs a GET request on the given URL. When the response arives it calls the completion handler passing
	/// the requested data if the request was successful or an error if something went wrong.
	///
	/// - Parameters:
	///   - urlString: A string with the URL from where the request must be done.
	///   - completionHandler: A block that receives an optional Data or Error depending on the result of the request.
	public func get(
		urlString: String,
		completionHandler: @escaping (_ data: Data?, _ error: Error?) -> Void) {
		guard let url = URL(string: urlString) else {
			let error = NSError(domain: "URL Error", code: 1, userInfo: nil)
			completionHandler(nil, error)
			return
		}
		
		var request = URLRequest(url: url)
		// azure precisa do header
//		request.addValue("0a94646cc935417783cfded1eab879a5", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
		let dataTask = session.dataTask(with: request) { (data, _, error) in
			completionHandler(data, error)
		}
		dataTask.resume()
	}
}
