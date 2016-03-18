//
//  ProductOrder.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation

class ProductOrder: NSObject {
    
    var productName: String!
    var price: Float!
    var orderQuantity: UInt!
    
    init?(name: String, quantity: UInt) {
        
        super.init()
        
        guard let path = NSBundle.mainBundle().pathForResource(kProductsPlistName, ofType:"plist") where name != "" && quantity > 0 else {
            return nil
        }
        
        guard let dict_products = NSDictionary(contentsOfFile: path) else {
            return nil
        }
        
        guard let dict_product = dict_products.objectForKey(name) else {
            return nil
        }
        
        guard let priceNumber = dict_product.objectForKey(kKey_price) else {
            return nil
        }
        
        productName = name
        price = priceNumber.floatValue
        orderQuantity = quantity        
        
    }    
    
}
