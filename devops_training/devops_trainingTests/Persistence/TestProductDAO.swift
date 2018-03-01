//
//  TestProductDAO.swift
//  devops_trainingTests
//
//  Created by Carlos Eduardo Millani on 01/03/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

@testable import devops_training

class TestProductDAO: ProductDAOProtocol {
    func getAllProducts() -> [ProductVO] {
        return [ProductVO(pID: "a", name: "Televisao", price: 1234.0)]
    }
    func createProduct(name: String, price: Double) {
        
    }
    func deleteProduct() {
        
    }
}
