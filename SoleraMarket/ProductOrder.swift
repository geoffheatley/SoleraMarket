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
    
    init(name: String, quantity: UInt) {
        
        guard let path = NSBundle.mainBundle().pathForResource(kProductsPlistName, ofType:"plist") else {
            return            
        }
        
        let dict_products = NSDictionary(contentsOfFile: path)
        
        if let dict_product = dict_products?.objectForKey(name) {
            
            productName = name
            price = dict_product.objectForKey(kKey_price)?.floatValue
            orderQuantity = quantity
            
        }
        
    }    
    
}
