//
//  ProductMechanism.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

class ProductMechanism {
    
    init() {
        let client = NetworkingClient()
        // https://devops-api.azure-api.net/test  -> azure url
        let clientString = "https://zzfu316epf.execute-api.us-east-2.amazonaws.com/DevOps/products"
        client.get(urlString: clientString) { (data, error) in
            
            guard let data = data else { return }
            var products: [ProductVO]
            do {
                let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                products = response.products
                print(products)
            } catch let error {
                print(error)
            }
        }
    }
    func getAll() {
    
    }
}
