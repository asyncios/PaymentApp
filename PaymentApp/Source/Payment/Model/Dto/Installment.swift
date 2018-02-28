//
//  Installment.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class Installment: NSObject {
    var payment_method_id: String?
    var payment_type_id: String?
    var issuer: Issuer?
    var processing_mode: String?
    var merchant_account_id: String?
    var payer_costs: [PayerCost]?
    
    init(dict: [String: Any?]) {
        if let value = dict["payment_method_id"] {
            payment_method_id = value as? String
        }
        if let value = dict["payment_type_id"] {
            payment_type_id = value as? String
        }
        if let value = dict["issuer"] {
            if let dict = value as? [String: Any?] {
                issuer = Issuer.init(dict: dict)
            }
        }
        if let value = dict["status"] {
            processing_mode = value as? String
        }
        if let value = dict["processing_mode"] {
            processing_mode = value as? String
        }
        if let value = dict["merchant_account_id"] {
            merchant_account_id = value as? String
        }
        if let value = dict["payer_costs"] {
            if let array = value as? [Any] {
                payer_costs = []
                for i in array {
                    if let dict = i as? [String: Any?] {
                        payer_costs?.append(PayerCost.init(dict: dict))
                    }
                }
            }
            
        }
    }
}
