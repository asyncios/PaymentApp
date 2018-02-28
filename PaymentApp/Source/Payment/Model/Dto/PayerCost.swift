//
//  PayerCost.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PayerCost: NSObject {
    var installments: Int?
    var installment_rate: Int?
    var discount_rate: Int?
    var labels: [String]?
    var installment_rate_collector: [String]?
    var min_allowed_amount: Int?
    var max_allowed_amount: Int?
    var recommended_message: String?
    var installment_amount: Int?
    var total_amount: Int?
    
    init(dict: [String: Any?]) {
        if let value = dict["installments"] {
            installments = value as? Int
        }
        if let value = dict["installment_rate"] {
            installment_rate = value as? Int
        }
        if let value = dict["discount_rate"] {
            discount_rate = value as? Int
        }
        if let value = dict["labels"] {
            labels = value as? [String]
        }
        if let value = dict["installment_rate_collector"] {
            installment_rate_collector = value as? [String]
        }
        if let value = dict["min_allowed_amount"] {
            min_allowed_amount = value as? Int
        }
        if let value = dict["max_allowed_amount"] {
            max_allowed_amount = value as? Int
        }
        if let value = dict["recommended_message"] {
            recommended_message = value as? String
        }
        if let value = dict["installment_amount"] {
            installment_amount = value as? Int
        }
        if let value = dict["total_amount"] {
            total_amount = value as? Int
        }
        
    }
}
