//
//  ProductsTableViewController.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 21/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let client = NetworkingClient()
		// https://devops-api.azure-api.net/test  -> azure url
		client.get(urlString: "https://zzfu316epf.execute-api.us-east-2.amazonaws.com/DevOps/products") { (data, error) in
			
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ProductDAO.shared.getAllProducts().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
			as? ProductTableViewCell else { return UITableViewCell() }
		
        let product = ProductDAO.shared.getAllProducts()[indexPath.item]
        
        cell.setupCell(title: product.name, price: product.price)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
