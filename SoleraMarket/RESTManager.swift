//
//  RESTManager.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation

class RESTManager: NSObject {
    
    static let sharedInstance = RESTManager()
    let shoppingBasket = ShoppingBasket.sharedInstance
    
    typealias CompletionHandler = (success:Bool) -> Void
    
    private let string_baseURL: NSString = "\(kProtocol)://\(kHost)/\(kApiExtension)"
    private let baseURL = NSURL(string: "\(kProtocol)://\(kHost)/\(kApiExtension)")
    
    private let JsonRates_API_AccessKey = NSBundle.mainBundle().objectForInfoDictionaryKey(kKey_JSONRates) as! String
    
    func getLiveRates(completionHandler: CompletionHandler) {
        
        let endpoint: String = "\(string_baseURL)/\(kExtension_live)?\(kKey_accessKey)=\(JsonRates_API_AccessKey)"
        let url = NSURL(string: endpoint)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue(kContentType, forHTTPHeaderField: "Content-Type")
        request.setValue(kContentType, forHTTPHeaderField: "Accept")
        
        log(self, message: "request:\n\n \(request.extendedDescription())\n")
        
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            guard error == nil && data != nil  else {
                log(self, message: "Failed to download data")
                completionHandler(success: false)
                return
            }
            
            do {
                let dict_json = try self.parseJSONData(data!, options: []) as! NSDictionary
                log(self, message: "dict_json: \(dict_json)")
                self.shoppingBasket.dict_exchangeRates = (dict_json.objectForKey("quotes") as? NSMutableDictionary)!
                completionHandler(success: true)
            } catch {
                log(self, message: "Unexpected data format provided by server")
                completionHandler(success: false)
            }

            
        }).resume() 
        
    }
    
    func parseJSONData(data: NSData, options opt: NSJSONReadingOptions) throws -> AnyObject {
        return try NSJSONSerialization.JSONObjectWithData(data, options: opt)
    }
    
}
