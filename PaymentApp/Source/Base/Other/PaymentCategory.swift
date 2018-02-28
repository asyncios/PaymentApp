//
//  PaymentCategory.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

extension String {
    
    var parseJSONString: [String:Any]? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            return try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [String:Any]
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    var parseJSONStringArray: [Dictionary<String,Any>]? {
        
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            return try? JSONSerialization.jsonObject(with: jsonData, options: []) as! [Dictionary<String,Any>]
        } else {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
    
    
}


extension CachedURLResponse {
    
    func responseWithExpirationDuration(duration:Int)->CachedURLResponse
    {
        var cachedResponse = self;
        let httpResponse = cachedResponse.response as! HTTPURLResponse;
        let headers = httpResponse.allHeaderFields;
        var newHeaders = headers as! [String:String];
        
        newHeaders["Cache-Control"] = String(format: "max-age=%i",duration)
        newHeaders.removeValue(forKey:"Expires");
        newHeaders.removeValue(forKey:"s-maxage");
        
        let newResponse = HTTPURLResponse(url: (httpResponse.url)!, statusCode: httpResponse.statusCode, httpVersion: "HTTP/1.1", headerFields: newHeaders)
        
        cachedResponse = CachedURLResponse(response: newResponse!, data: cachedResponse.data, userInfo: newHeaders, storagePolicy: cachedResponse.storagePolicy)
        return cachedResponse;
    }
}
