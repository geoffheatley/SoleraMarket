//
//  ShoppingBasket.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation


class ShoppingBasket: NSObject {
    
    static let sharedInstance = ShoppingBasket()
    
    var items: NSMutableDictionary = NSMutableDictionary()
    var dict_exchangeRates: NSMutableDictionary = NSMutableDictionary()
    var currencyIndex = 0
    var currencySymbol = "US$"
    var multiplier: Float = 1.0
    var runningTotal: Float = 0.0
    var pendingIndex: Int = -1
    
    func productOrdersArray() -> NSArray {
        
        let array_order = NSMutableArray()
        
        for (_, object) in items { array_order.addObject(object) }
        
        return array_order
        
    }
    
    func updateCurrancyForIndex(index: Int) {
        
        let currencyCode = currencyCodeForIndex(index)
        log(self, message: "currencyCode: \(currencyCode)")
        
        let currencyKey = "USD\(currencyCode)"
        
        if let number = dict_exchangeRates.objectForKey(currencyKey) as? NSNumber {

            currencyIndex = index
        
            multiplier = number.floatValue
            log(self, message: "multiplier: \(multiplier)")
            
            setCurrencySymbol()
            log(self, message: "currencySymbol: \(currencySymbol)")
            
        } else {
            
            log(self, message: "No \(currencyKey) currency key found in dict_exchangeRates")
            
        }
        
    }
    
    func updateRunningTotal() {
        
        runningTotal = 0.0
        
        for item in productOrdersArray() {
            
            if let productOrder = item as? ProductOrder {
            
                runningTotal = runningTotal + productOrder.price * Float(productOrder.orderQuantity)
                
            }
        
        }
        
    }
    
    func cancelPendingIndex() {
        
        pendingIndex = -1        
        
    }
    
    func updateForPendingIndex() {
        
        if pendingIndex >= 0 {
        
            updateCurrancyForIndex(pendingIndex)
            
        }
        
    }
    
    func resetShoppingBasket() {
        
        items.removeAllObjects()
        dict_exchangeRates.removeAllObjects()
        currencyIndex = 0
        multiplier = 1.0
        runningTotal = 0.0
        pendingIndex = -1
        setCurrencySymbol()
        
    }
    
    func currencyCodeForIndex(index: Int) -> String {
        
        return kArrayCurrencies[index] as String
        
    }
    
    func setCurrencySymbol() {
    
        let localeComponents = [NSLocaleCurrencyCode: currencyCodeForIndex(currencyIndex)]
        let localeIdentifier = NSLocale.localeIdentifierFromComponents(localeComponents)
        let locale = NSLocale(localeIdentifier: localeIdentifier)
        currencySymbol = locale.objectForKey(NSLocaleCurrencySymbol) as! String
        
    }
    
}