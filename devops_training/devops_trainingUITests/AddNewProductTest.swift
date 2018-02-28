//
//  AddNewProductTest.swift
//  devops_trainingUITests
//
//  Created by Rodrigo Carvalho da Silva on 27/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import XCTest

class AddNewProductTest: XCTestCase {
	
	var app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
		app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		app.terminate()
    }
    
    func testAddNewProductNavigation() {
		
		let addButton = app.navigationBars["Produtos"].buttons["Add"]
		addButton.tap()
		
		let produtosButton = app.navigationBars["devops_training.ProductCreationView"].buttons["Produtos"]
		produtosButton.tap()
		addButton.tap()
		produtosButton.tap()
    }
}
