//
//  CheckoutCell.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class CheckoutCell: BaseCell {
    
    @IBOutlet weak var label_subtotal: UILabel!

    func setupForProductOrder(productOrder: ProductOrder) {
        
        imageView.image = UIImage(named: "\(kProductImagePrefix)\(productOrder.productName)")
        label_count.text = "\(productOrder.orderQuantity)"
        label_price.text = String(format: "\(viewController!.shoppingBasket.currencySymbol) %.2f",  productOrder.price * viewController!.shoppingBasket.multiplier)
        label_name.text = "\(productOrder.productName)"
        
        let subtotal = productOrder.price * Float(productOrder.orderQuantity)
        label_subtotal.text = String(format: "\(viewController!.shoppingBasket.currencySymbol) %.2f", subtotal * viewController!.shoppingBasket.multiplier)
        
        count = productOrder.orderQuantity
        
    }
    
    override func prepareForReuse() {
        
        count = 0
        label_count.text = "\(count)"
        label_count.textColor = kTextColour_normal
        label_count.backgroundColor = kFieldColour_normal
        
    }


}