//
//  BaseViewController.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 16/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class StoreViewController: BaseCollectionViewController {
    
    private let sectionInsets = UIEdgeInsets(top: kGutterTop, left: kGutterLeft, bottom: kGutterBot, right: kGutterRight)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupDataSource()        
        
    }
    
    func setupDataSource() {
        
        if let path = NSBundle.mainBundle().pathForResource(kProductsPlistName, ofType:"plist") {
            
            if let dict_products = NSMutableDictionary(contentsOfFile: path) {
            
                for (key, object) in dict_products {
                    
                    object.setObject(key, forKey: kKey_name)
                    self.array_products.addObject(object)
                
                }
                
            }
            
        }
    
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array_products.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: UIScreen.mainScreen().bounds.width - (kGutterLeft + kGutterRight), height: UIScreen.mainScreen().bounds.height/2)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
 
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //log(self, message: "")
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kStoreCellIdentifier, forIndexPath: indexPath) as! StoreCell
        
        cell.viewController = self
        let name = self.array_products.objectAtIndex(indexPath.item).objectForKey(kKey_name) as! String
        cell.setup(name, indexPath: indexPath)

        return cell
        
    }
    
    @IBAction func checkoutButtonPressed(sender: UIBarButtonItem) {
        
        log(self, message: "")
        presentCheckoutViewController()
        soundManager.playSound(.Click)
        
    }
    
    func presentCheckoutViewController() {
        
        let storyboard = UIStoryboard(name: kStoryboardName, bundle: nil)
        let checkoutViewController = storyboard.instantiateViewControllerWithIdentifier(kCheckoutViewControllerIdentifier)
        self.navigationController?.pushViewController(checkoutViewController, animated: true)
        
    }
    
    
    
}