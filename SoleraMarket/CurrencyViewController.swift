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
    let restManager = RESTManager.sharedInstance
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var view_picker: UIView!
    @IBOutlet weak var view_failure: UIView!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var label_failure: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label_failure.text = kMessageConnectionFailure
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        setToLoadingState()
        
        restManager.getLiveRates({ (success) -> Void in
            
            if success {
                self.performSelectorOnMainThread("setToReadyState", withObject: nil, waitUntilDone: false)
            } else {
                self.performSelectorOnMainThread("setToFailedState", withObject: nil, waitUntilDone: false)                
            }
            
        })
        
    }
    
    func setToLoadingState() {
        
        activityIndicator.startAnimating()
        view_picker.hidden = true
        view_failure.hidden = true
        
    }
    
    func setToReadyState() {
        
        self.activityIndicator.stopAnimating()
        self.currencyPicker.selectRow(self.shoppingBasket.currencyIndex, inComponent: 0, animated: false)
        self.view_failure.hidden = true
        self.view_picker.hidden = false
        
    }
    
    func setToFailedState() {
    
        self.activityIndicator.stopAnimating()
        self.view_picker.hidden = true
        self.view_failure.hidden = false
        
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
