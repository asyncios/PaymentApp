//
//  PaymentParser.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentParser: NSObject {
    static func parsePaymentMethods(response: String) -> [PaymentMethod]?{
        if let array = response.parseJSONStringArray
        {
            var methods: [PaymentMethod] = []
            for i in array{
                let method = PaymentMethod.init(dict: i)
                methods.append(method)
            }
            
            return methods
        }
        return nil
    }
    
    static func parseCardIssuers(response: String) -> [CardIssuer]?{
        if let array = response.parseJSONStringArray
        {
            var cardIssuers: [CardIssuer] = []
            for i in array{
                let method = CardIssuer.init(dict: i)
                cardIssuers.append(method)
            }
            
            return cardIssuers
        }
        return nil
    }
    
    static func parseInstallments(response: String) -> [Installment]?{
        if let array = response.parseJSONStringArray
        {
            var installments: [Installment] = []
            for i in array{
                let installment = Installment.init(dict: i)
                installments.append(installment)
            }
            
            return installments
        }
        return nil
    }
}
