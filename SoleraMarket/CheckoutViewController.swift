//
//  CheckoutViewController.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 16/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class CheckoutViewController: BaseCollectionViewController {
    
    private let sectionInsets = UIEdgeInsets(top: kGutterTop, left: 0, bottom: kGutterBot, right: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingBasket.items.count + 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height/7)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let productOrdersArray: NSArray = shoppingBasket.productOrdersArray() {
            
            //log(self, message: "indexPath.row: \(indexPath.row) productOrdersArray.count: \(productOrdersArray.count)")

            if indexPath.row == productOrdersArray.count {
                
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCheckoutFooterIdentifier, forIndexPath: indexPath) as! CheckoutFooter
                cell.viewController = self
                
                if productOrdersArray.count == 0 {
                    
                    cell.label_feedback.hidden = false
                    cell.label_total.text = "\(shoppingBasket.currencySymbol) 0.00"
                    
                } else {
                    
                    cell.label_feedback.hidden = true
                    cell.label_total.text = String(format: "\(shoppingBasket.currencySymbol) %.2f", shoppingBasket.runningTotal * shoppingBasket.multiplier)
                    
                }
                
                return cell
                
            } else {
        
                let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCheckoutCellIdentifier, forIndexPath: indexPath) as! CheckoutCell
                cell.viewController = self
            
                if let productOrder = productOrdersArray.objectAtIndex(indexPath.item) as? ProductOrder {
                
                    cell.setupForProductOrder(productOrder)
                    
                }
                
                return cell
            
            }
            
        }
        
    }
    
    @IBAction func currencyButtonPressed(sender: UIBarButtonItem) {
    
        log(self, message: "")
        soundManager.playSound(.Click)
        presentCurrencyViewController()
        
    
    }
    
    @IBAction func done(segue: UIStoryboardSegue) {

        soundManager.playSound(.ProtonPack)
        shoppingBasket.updateForPendingIndex()
        
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {

        shoppingBasket.cancelPendingIndex()
        
    }
    
    func presentCurrencyViewController() {
        
        let storyboard = UIStoryboard(name: kStoryboardName, bundle: nil)
        let currencyViewController = storyboard.instantiateViewControllerWithIdentifier(kCurrencyViewControllerIdentifier)
        self.navigationController?.pushViewController(currencyViewController, animated: true)
        
    }
    
}