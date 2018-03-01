//
//  ProductsTableViewController.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 21/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    let assembler: Assembler
    let productDAO: ProductDAOProtocol
    
//    override init(style: UITableViewStyle) {
//        super.init(style: style)
//
//    }
    
    required init?(coder aDecoder: NSCoder) {
        self.assembler = DevOpsAssembler.shared
        self.productDAO = assembler.resolve()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.productDAO.getAllProducts().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
			as? ProductTableViewCell else { return UITableViewCell() }
		
        let product = self.productDAO.getAllProducts()[indexPath.item]
        
        cell.setupCell(title: product.name, price: product.price)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
