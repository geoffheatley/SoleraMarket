//
//  ProductOrderTests.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 18/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import XCTest
@testable import SoleraMarket

class ProductOrderTests: XCTestCase {
    
    var productName = "Eggs"
    var price = 2.50
    var orderQuantity = 2
    
    var productOrder: ProductOrder!
    var dictProduct: NSDictionary!
    
    override func setUp() {
        super.setUp()
        productOrder = ProductOrder(name: "Eggs", quantity: 2)
        dictProduct = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource(kProductsPlistName, ofType:"plist")!)!.objectForKey("Eggs") as! NSDictionary
        
    }
    
    override func tearDown() {
        productOrder = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testProductOrderIsNotInitializedFromBlankProductName() {
        XCTAssertNil(ProductOrder(name: "", quantity: 2), "No object must be returned from a blank product name")
    }
    
    func testProductOrderIsNotInitializedFromInvalidProductName() {
        XCTAssertNil(ProductOrder(name: "M16 Assault Rifle", quantity: 2), "No object must be returned from an invalid product name")
    }
    
    func testProductOrderIsNotInitializedFromZeroQuantity() {
        XCTAssertNil(ProductOrder(name: "Eggs", quantity: 0), "No object must be returned for zero quantity")
    }
    
    func testPriceAssignement() {
        XCTAssertEqual(productOrder.price, dictProduct.objectForKey(kKey_price)?.floatValue, "Price should be assigned to the corresponding value in the StoreProducts.plist")
    }
    
}
