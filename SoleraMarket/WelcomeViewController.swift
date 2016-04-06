//
//  WelcomeViewController.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 16/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    let shoppingBasket = ShoppingBasket.sharedInstance
    let soundManager = SoundManager.sharedInstance
    
    @IBOutlet weak var view_bottomGroup: UIView!
    @IBOutlet weak var label_versionNumber: UILabel!
    @IBOutlet weak var label_buildNumber: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        label_versionNumber.text = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String
        label_buildNumber.text = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as? String
        
        #if DEBUG
            view_bottomGroup.hidden = false
        #else
            view_bottomGroup.hidden = true
        #endif
        
    }
   
    @IBAction func done(segue: UIStoryboardSegue) {
        
        log(self, message: "Logged Out")
        shoppingBasket.resetShoppingBasket()
        
    }
  
    
}