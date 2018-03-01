//
//  ProductCreationViewController.swift
//  devops_training
//
//  Created by Carlos Eduardo Millani on 22/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import UIKit

class ProductCreationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productName: UITextField!
    
    let assembler: Assembler
    let productDAO: ProductDAOProtocol
    
    required init?(coder aDecoder: NSCoder) {
        self.assembler = DevOpsAssembler.shared
        self.productDAO = assembler.resolve()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createProduct() {
        guard let name = productName.text else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        guard let priceStr = productPrice.text else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        guard let price = Double(priceStr) else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.productDAO.createProduct(name: name, price: price)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createProduct(_ sender: Any) {
        createProduct()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createProduct()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
