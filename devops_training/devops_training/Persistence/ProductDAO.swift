//
//  ProductDAO.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 22/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit
import RealmSwift

@objcMembers class Product: Object {
    dynamic var pID: String = UUID().uuidString
    dynamic var name: String = ""
    dynamic var price: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "pID"
    }
}

protocol ProductDAOProtocol {
    func getAllProducts() -> [ProductVO]
    func deleteProduct()
    func createProduct(name: String, price: Double)
}

class ProductDAO: ProductDAOProtocol {
    
    func createProduct(name: String, price: Double) {
        let ROProduct = Product()
        ROProduct.name = name
        ROProduct.price = price
        
		do {
			let realm = try Realm()
			
			try realm.write {
				realm.add(ROProduct)
			}
		} catch let error {
			print(error)
		}
    }
    
    func deleteProduct() {
    }
    
    func getAllProducts() -> [ProductVO] {
		var products: [ProductVO] = []
		
		do {
			let realm = try Realm()
			
			let ROProducts = realm.objects(Product.self)
			
			for product in ROProducts {
				products.append(ProductVO(pID: product.pID, name: product.name, price: product.price))
			}
		} catch let error {
			print(error)
		}
		
		return products
    }
}
