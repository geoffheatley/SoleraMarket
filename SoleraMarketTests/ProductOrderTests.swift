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
    
    let kValidProductName = "Eggs"
    let kInvalidProductName = "M16 Assault Rifle"
    let kValidQuantity: UInt = 2
    
    var productName: String!
    var price: Float!
    var orderQuantity: UInt!
    
    var productOrder: ProductOrder!
    var dictProduct: NSDictionary!
    
    override func setUp() {
        
        super.setUp()
        
        productOrder = ProductOrder(name: kValidProductName, quantity: kValidQuantity)
        dictProduct = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource(kProductsPlistName, ofType:"plist")!)!.objectForKey(kValidProductName) as! NSDictionary
        
    }
    
    override func tearDown() {
        productOrder = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testProductOrderIsNotInitializedFromBlankProductName() {
        XCTAssertNil(ProductOrder(name: "", quantity: kValidQuantity), "No object must be returned from a blank product name")
    }
    
    func testProductOrderIsNotInitializedFromInvalidProductName() {
        XCTAssertNil(ProductOrder(name: kInvalidProductName, quantity: kValidQuantity), "No object must be returned from an invalid product name")
    }
    
    func testProductOrderIsNotInitializedFromZeroQuantity() {
        XCTAssertNil(ProductOrder(name: kValidProductName, quantity: 0), "No object must be returned for zero quantity")
    }
    
    func testPriceAssignement() {
        XCTAssertEqual(productOrder.price, dictProduct.objectForKey(kKey_price)?.floatValue, "Price should be assigned to the corresponding value in the StoreProducts.plist")
    }
    
    
}










