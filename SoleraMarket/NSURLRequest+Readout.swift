//
//  NSURLRequest+Readout.swift
//  SoleraMarket
//
//  Created by Geoff Heatley on 17/03/2016.
//  Copyright © 2016 Arcuna. All rights reserved.
//

import Foundation

extension NSURLRequest {
    
    public func extendedDescription() -> String {
        
        var result = "<\(NSStringFromClass(self.dynamicType)): " + String(format: "%p", self)
        result += "; HTTPMethod=" + (HTTPMethod ?? "nil") + "; URL=\(URL!); timeoutInterval=" + String(format: "%.1fs", timeoutInterval) + "> {"
        
        if let headers = allHTTPHeaderFields {
            
            result += "\nallHTTPHeaderFields {"
            for (key, value) in headers { result += "\n\n\t\(key) : '\(value)'" }
            result += "\n}"
            
        }
        
        if let body = HTTPBody {
            result += "\nHTTPBody {\n " + ((NSString(data: body, encoding: NSASCIIStringEncoding) ?? "") as String) + "}"
        }
        
        return result + "\n}"
    }
    
    public override var debugDescription: String {
        return extendedDescription()
    }
    
    public override var description: String {
        return extendedDescription()
    }
    
}