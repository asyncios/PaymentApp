//
//  AlamoFireCallApi.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
import Alamofire

class AlamoFireCallApi: RequestCallApi {
    
    var url: String?
    var header: [String:String]?
    var parameters: Parameters?
    var sessionManager: SessionManager?
    var cache: Int?
    var method = HTTPMethod.get
    
    func setUrl(url: String)
    {
        self.url = url
    }
    func setParameters(parameters:[String:Any])
    {
        self.parameters = parameters
    }
    func setHeader(header:[String:String])
    {
        self.header = header
    }
    func setCache(cache:Int)
    {
        self.cache = cache
        
    }
    
    func setup(){
        method = HTTPMethod.get
        if parameters != nil
        {
            method = HTTPMethod.post
        }
        
        if self.cache != nil && self.cache! > 0
        {
            sessionManager = Alamofire.SessionManager.default
            sessionManager?.session.configuration.urlCache = nil
        }
        else
        {
            let configuration = URLSessionConfiguration.default
            sessionManager = Alamofire.SessionManager(configuration: configuration)
            sessionManager?.session.configuration.urlCache = nil
        }
    }
    
    func execute(delegate:CallApiProtocol)
    {
        delegate.onStart()
        setup()
        
        sessionManager?.request(self.url!, method: method, parameters: self.parameters, headers:self.header)
            .responseJSON { response in
                
                if self.cache != nil && self.cache! > 0
                {
                    var cachedResponse = URLCache.shared.cachedResponse(for: response.request!)
                    cachedResponse = cachedResponse?.responseWithExpirationDuration(duration: self.cache!)
                    if cachedResponse != nil
                    {
                        URLCache.shared.storeCachedResponse(cachedResponse!, for: response.request!)
                    }
                }
                
                switch response.result
                {
                case .success:
                    if response.response?.statusCode == 200 { // is valid response
                        if let string = String(data: response.data!, encoding: String.Encoding.utf8){ //if content can be obtained
                            delegate.onComplete(response: string)
                            return
                        }
                    }
                    
                    let error = PaymentErrorImpl()
                    error.withResponseAny(response: response)
                    delegate.onError(error: error)
                    
                    break
                case .failure:
                    let error = PaymentErrorImpl()
                    error.withResponseAny(response: response)
                    delegate.onError(error: error)
                    break
                }
                
        }
        
    }
}
