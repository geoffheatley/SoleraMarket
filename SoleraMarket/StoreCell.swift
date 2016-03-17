//
//  StoreCell.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 16/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class StoreCell: BaseCell {
    
    
    
    
    
    
    func setup(name: String, indexPath: NSIndexPath) {
        
        //log(self, message: "self.viewController!.shoppingBasket.itemArray(): \(self.viewController!.shoppingBasket.productOrdersArray())")
            
        if let productOrder = viewController!.shoppingBasket.items.objectForKey(name) as? ProductOrder {
                
            imageView.image = UIImage(named: "\(kProductImagePrefix)\(productOrder.productName)")
            log(self, message: "imageName: \(kProductImagePrefix)\(productOrder.productName)")
            label_count.text = "\(productOrder.orderQuantity)"
            label_price.text = String(format: "$%.2f", productOrder.price)
            
            label_count.textColor = kTextColour_selected
            label_count.backgroundColor = kFieldColour_selected
            
            count = productOrder.orderQuantity
                
        } else {
            
            let dict_product: NSDictionary = self.viewController!.array_products.objectAtIndex(indexPath.item) as! NSDictionary
            let name: String = dict_product.objectForKey(kKey_name) as! String
            let price: Float = (dict_product.objectForKey(kKey_price)!.floatValue)!
            
            label_name.text = name
            label_price.text = String(format: "$%.2f", price)
            imageView.image = UIImage(named: "\(kProductImagePrefix)\(name)")
            log(self, message: "imageName: \(kProductImagePrefix)\(name)")
            
            label_count.textColor = kTextColour_normal
            label_count.backgroundColor = kFieldColour_normal
            
            count = 0
            
        }
 
    }
    
    
    override func prepareForReuse() {
        
        count = 0
        label_count.text = "\(count)"
        label_count.textColor = kTextColour_normal
        label_count.backgroundColor = kFieldColour_normal
        
    }
    
    
}
