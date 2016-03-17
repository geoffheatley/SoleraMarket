//
//  Globals.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 16/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation
import UIKit


//MARK: API

let kProtocol = "http"
let kHost = "apilayer.net"
let kApiExtension = "api"
let kExtension_live = "live"
let kKey_accessKey = "access_key"
let kKey_currencies = "currencies"
let kContentType = "application/json; charset=utf-8"
let kArrayCurrencies = ["USD", "GBP", "EUR", "JPY", "AUD", "CAD"]
let kKey_JSONRates = "JsonRates_API_AccessKey"
let kMessageConnectionFailure = "Failed to obtain live currency data.\n Try again later."



//MARK: Integral Values

let kStoryboardName = "Main"
let kCurrencyViewControllerIdentifier = "CurrencyViewController"
let kCheckoutViewControllerIdentifier = "CheckoutViewController"

let kProductsPlistName = "StoreProducts"
let kGutter: CGFloat = 10.0
let kGutterTop: CGFloat = 10.0
let kGutterBot: CGFloat = 50.0
let kGutterLeft: CGFloat = 50.0
let kGutterRight: CGFloat = 50.0

let kNumSections = 1

let kPickerRowHeight: CGFloat = 50.0
let kPickerRowWidth: CGFloat = 300.0

let kStoreCellIdentifier = "StoreCell"
let kCheckoutCellIdentifier = "CheckoutCell"
let kCheckoutFooterIdentifier = "CheckoutFooter"

let kKey_name = "name"
let kKey_price = "price"


let kProductImagePrefix = "Product_"

let kAudioPath = "Assets/Audio"





//MARK: Colours

let kTextColour_normal = UIColor.darkGrayColor()
let kTextColour_selected = UIColor(red: 1.0, green: 0.05, blue: 0.05, alpha: 1.0)
let kFieldColour_normal = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let kFieldColour_selected = UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 1.0)


//MARK: Utility Functions

func log(sender: NSObject, message: String, functionName: String = __FUNCTION__) {
    
    #if DEBUG
        if message == "" {
            
            print("\(NSStringFromClass(sender.classForCoder)) - \(functionName)")
            
        } else {
            
            print("\(NSStringFromClass(sender.classForCoder)) - \(functionName) - \(message)")
            
        }
    #endif
    
}


//MARK: Enumerators

enum SoundName: String {
    
    case Click
    case ProtonPack
    
}