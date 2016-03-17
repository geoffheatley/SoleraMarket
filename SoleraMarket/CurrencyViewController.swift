//
//  CurrencyViewController.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let soundManager = SoundManager.sharedInstance
    let shoppingBasket = ShoppingBasket.sharedInstance
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewWillAppear(animated: Bool) {
        currencyPicker.selectRow(shoppingBasket.currencyIndex, inComponent: 0, animated: false)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kArrayCurrencies.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kArrayCurrencies[row]
    }

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return kPickerRowHeight
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kPickerRowWidth
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        soundManager.playSound(.Click)
        shoppingBasket.pendingIndex = row
        
    }
    
}
