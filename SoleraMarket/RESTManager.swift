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
    
    private let string_baseURL: NSString = "\(kProtocol)://\(kHost)/\(kApiExtension)"
    private let baseURL = NSURL(string: "\(kProtocol)://\(kHost)/\(kApiExtension)")
    
    private let JsonRates_API_AccessKey = NSBundle.mainBundle().objectForInfoDictionaryKey(kKey_JSONRates) as! String
    
    
    func getLiveRates() {
        
        let endpoint: String = "\(string_baseURL)/\(kExtension_live)?\(kKey_accessKey)=\(JsonRates_API_AccessKey)"
        let url = NSURL(string: endpoint)!
        let session = NSURLSession.sharedSession()
        //let params : [String: AnyObject] = [kKey_accessKey: JsonRates_API_AccessKey/*, kKey_currencies: kArrayCurrencies, "format": 1*/]
        
        //log(self, message: "params: \(params)")
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue(kContentType, forHTTPHeaderField: "Content-Type")
        request.setValue(kContentType, forHTTPHeaderField: "Accept")
        
        
        //let bodyData = "\(kKey_accessKey)=\(JsonRates_API_AccessKey)"//&\(kKey_currencies)=\(kArrayCurrencies)&format=1"
        //request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        /*do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions())
        } catch {
            log(self, message: "Error writing JSON body")
            //self.signupErrored()
            return
        }*/
        
        log(self, message: "request:\n\n \(request.extendedDescription())\n")

        
        session.dataTaskWithRequest(request, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            /*guard let realResponse = response as? NSHTTPURLResponse /*where realResponse.statusCode == 202*/ else {
                
                log(self, message: "Real response failed")
                //self.signupFailure()
                return
                
            }
            
            let localisedStatusCode = NSHTTPURLResponse.localizedStringForStatusCode(realResponse.statusCode)
            log(self, message: "statusCode:\(realResponse.statusCode) \(localisedStatusCode)");
            log(self, message: "realResponse: \(realResponse)")*/
            
            if data != nil {
                
                do {
                    let dict_json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                    log(self, message: "dict_json: \(dict_json)")
                    self.shoppingBasket.dict_exchangeRates = (dict_json.objectForKey("quotes") as? NSMutableDictionary)!
                } catch {
                    log(self, message: "JSON error")
                    //self.signupErrored()
                    return
                }
                
                
            }
            
            //self.signupSuccess()
            
        }).resume()
        
        
        
        
        
    }
    
}
