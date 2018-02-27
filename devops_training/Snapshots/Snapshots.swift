//
//  Snapshots.swift
//  Snapshots
//
//  Created by Rodrigo Carvalho da Silva on 27/02/18.
//  Copyright © 2018 caduebahia. All rights reserved.
//

import XCTest

class Snapshots: XCTestCase {
	
	let app = XCUIApplication()
	
    override func setUp() {
        super.setUp()
		
        continueAfterFailure = false
		setupSnapshot(app)
		app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
		app.terminate()
    }
    
    func testTakeSnapshotHome() {
		snapshot("Home Screen")
    }
	
	func testTakeSnaphotAddProduct() {
		app.navigationBars["Produtos"].buttons["Add"].tap()
		snapshot("Add Product Screen")
	}
    
}
