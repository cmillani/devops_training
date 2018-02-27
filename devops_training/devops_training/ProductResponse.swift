//
//  ProductResponse.swift
//  devops_training
//
//  Created by Rodrigo Carvalho da Silva on 27/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import Foundation

struct ProductResponse: Codable {
	let products: [ProductVO]
	
	enum CodingKeys: String, CodingKey {
		case products = "response"
	}
}
