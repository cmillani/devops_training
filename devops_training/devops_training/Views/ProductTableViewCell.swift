//
//  ProductTableViewCell.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 21/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title: String, price: Double) {
        productTitle.text = title
        productPrice.text = String(price)
    }

}
