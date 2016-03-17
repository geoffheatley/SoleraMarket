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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func done(segue: UIStoryboardSegue) {
        
        print("Logout")
        shoppingBasket.resetShoppingBasket()
        
    }    
    
}