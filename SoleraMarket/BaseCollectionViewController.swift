//
//  BaseCollectionViewController.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    let shoppingBasket = ShoppingBasket.sharedInstance
    let soundManager = SoundManager.sharedInstance
    
    var array_products = NSMutableArray()
    
    override func viewWillAppear(animated: Bool) {
        collectionView!.reloadData()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return kNumSections
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return kGutter
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return kGutter
    }
    
}
