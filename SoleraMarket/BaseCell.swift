//
//  BaseCell.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class BaseCell: UICollectionViewCell {
    
    var viewController: BaseCollectionViewController?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_price: UILabel!
    @IBOutlet weak var label_count: UILabel!
    @IBOutlet weak var button_subtract: UIButton!
    @IBOutlet weak var button_add: UIButton!
    
    var count: UInt = 0
    
    @IBAction func subtractButtonPressed(sender: UIButton!) {
        
        log(self, message: "")
        
        self.viewController!.soundManager.playSound(.Click)
        
        if count > 0 {
            
            count--
            
        }
        
        if let productOrder = ProductOrder(name: label_name.text!, quantity: count) {
        
            if count == 0 {
                
                if sender.tag == 0 {
                    label_count.textColor = kTextColour_normal
                    label_count.backgroundColor = kFieldColour_normal
                }
                
                self.viewController?.shoppingBasket.items.removeObjectForKey(label_name.text!)
                
            } else {            
                
                self.viewController?.shoppingBasket.items.setObject(productOrder, forKey: label_name.text!)
                
            }
    
        }
        
        label_count.text = "\(count)"
        
        self.viewController!.shoppingBasket.updateRunningTotal()
        self.viewController!.collectionView!.reloadData()
        
    }
    
    @IBAction func addButtonPressed(sender: UIButton!) {
        
        log(self, message: "")
        
        self.viewController!.soundManager.playSound(.Click)
        
        count++
        
        label_count.text = "\(count)"
        
        if sender.tag == 0 {
            label_count.textColor = kTextColour_selected
            label_count.backgroundColor = kFieldColour_selected
        }
        
        log(self, message: "count: \(count)")
        
        if let productOrder = ProductOrder(name: label_name.text!, quantity: count) {
            self.viewController?.shoppingBasket.items.setObject(productOrder, forKey: label_name.text!)
        }
        
        self.viewController!.shoppingBasket.updateRunningTotal()
            
        self.viewController!.collectionView!.reloadData()
        
    }
    
}