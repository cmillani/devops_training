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
    dynamic var id: String = UUID().uuidString
    dynamic var name: String = ""
    dynamic var price: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class ProductDAO {
    
    static let shared: ProductDAO = ProductDAO()
    
    private init(){}
    
    func createProduct(name: String, price: Double) {
        let ROProduct = Product()
        ROProduct.name = name
        ROProduct.price = price
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(ROProduct)
        }
    }
    
    func deleteProduct() {
        
    }
    
    func getAllProducts() -> [ProductVO] {
        let realm = try! Realm()
        
        let ROProducts = realm.objects(Product.self)
        var products: [ProductVO] = []
        
        for product in ROProducts {
            products.append(ProductVO(id: product.id, name: product.name, price: product.price))
        }
        
        return products
    }
}
