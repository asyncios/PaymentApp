//
//  PaymentMethod.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentMethod: NSObject {
    var paymentMethodId : String?
    var name : String?
    var payment_type_id : String?
    var status : String?
    var secure_thumbnail : String?
    var thumbnail : String?
    var deferred_capture : String?
    var settings : [Any?]?
    var additional_info_needed : [String]?
    var min_allowed_amount: Int?
    var max_allowed_amount: Int?
    var financial_institutions: [Any]?
    var processing_modes : [String]?
    
    init(dict: [String: Any?]) {
        if let value = dict["id"] {
            paymentMethodId = value as? String
        }
        if let value = dict["name"] {
            name = value as? String
        }
        if let value = dict["payment_type_id"] {
            payment_type_id = value as? String
        }
        if let value = dict["status"] {
            status = value as? String
        }
        if let value = dict["secure_thumbnail"] {
            secure_thumbnail = value as? String
        }
        if let value = dict["thumbnail"] {
            thumbnail = value as? String
        }
        if let value = dict["deferred_capture"] {
            deferred_capture = value as? String
        }
        if let value = dict["settings"] {
            settings = value as? [String]
        }
        if let value = dict["min_allowed_amount"] {
            min_allowed_amount = value as? Int
        }
        if let value = dict["min_allowed_amount"] {
            min_allowed_amount = value as? Int
        }
        if let value = dict["financial_institutions"] {
            financial_institutions = value as? [Any]
        }
        if let value = dict["processing_modes"] {
            processing_modes = value as? [String]
        }
        
        
    }
}
