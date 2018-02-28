//
//  CardIssuer.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class CardIssuer: NSObject {
    var issuerId : String?
    var name : String?
    var secure_thumbnail: String?
    var thumbnail : String?
    var processing_mode : String?
    var merchant_account_id : String?
    
    init(dict: [String: Any?]) {
        if let value = dict["id"] {
            issuerId = value as? String
        }
        if let value = dict["name"] {
            name = value as? String
        }
        if let value = dict["secure_thumbnail"] {
            secure_thumbnail = value as? String
        }
        if let value = dict["thumbnail"] {
            thumbnail = value as? String
        }
        if let value = dict["processing_mode"] {
            processing_mode = value as? String
        }
        if let value = dict["merchant_account_id"] {
            merchant_account_id = value as? String
        }
        
    }
}
