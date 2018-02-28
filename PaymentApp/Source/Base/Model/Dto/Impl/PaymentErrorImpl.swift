//
//  PaymentErrorImpl.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
import Alamofire

class PaymentErrorImpl: PaymentError {
    var code: Int?
    var name: String?
    var message: String = ""
    var errorFields: [PaymentError] = []
    var otherMessages: NSArray?
    
    func withResponse(response:HTTPURLResponse?, error:Error?)
    {
        if response != nil
        {
            code = response?.statusCode
            if code == 422
            {
                if error != nil
                {
                    message = error!.localizedDescription
                }
                else
                {
                    message = StringConstant.ERROR_PROBLEM_SYNCRONIZE
                }
                
            }
            else if code! >= 400 && code! < 600
            {
                if error != nil
                {
                    message = error!.localizedDescription
                }
                else
                {
                    message = StringConstant.ERROR_PROBLEM_SYNCRONIZE
                }
            }
            else if code == 0
            {
                message = StringConstant.ERROR_PROBLEM_SYNCRONIZE
            }
            else
            {
                message = StringConstant.ERROR_UNKNOWN
            }
        }
        else
        {
            message = StringConstant.ERROR_UNKNOWN
        }
    }
    
    func withResponseAny(response:DataResponse<Any>)
    {
        //Default message
        message = StringConstant.ERROR_UNKNOWN
        
        if let code = response.response?.statusCode{
            if code == 0{
                message = StringConstant.ERROR_PROBLEM_SYNCRONIZE
            }else if code == 422{
                if let json = response.result.value as? NSDictionary {
                    let errors = json["errors"] as! [NSDictionary]
                    errorFields = []
                    message = ""
                    for error in errors{
                        let newError = PaymentErrorImpl()
                        newError.name = error["field"] as? String
                        newError.message = error["message"] as! String
                        errorFields.append(newError)
                        
                        message = "\(newError.message)\n"
                    }
                }
            } else if code == 429 {
                message = StringConstant.ERROR_TOO_MANY_REQUESTS
            } else if (code >= 400 && code<600){
                if let res = response.result.value as? [String : AnyObject]{
                    message = res["message"] as! String
                }else{
                    message = StringConstant.ERROR_UNKNOWN
                }
            }
        }
    }
}
