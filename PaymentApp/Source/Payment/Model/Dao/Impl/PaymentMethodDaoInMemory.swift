//
//  PaymentMethodDaoInMemory.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentMethodDaoInMemory: PaymentMethodDao {
    
    var methods: [PaymentMethod]?
    var methodsDict: [String: PaymentMethod]?
    
    func getPaymentMethods() -> [PaymentMethod]?
    {
        return methods
    }
    
    func getPaymentMethod(paymentMethodId: String) -> PaymentMethod?
    {
        return methodsDict?[paymentMethodId]
    }
    
    func setPaymentMethods(methods: [PaymentMethod]?)
    {
        self.methods = methods
        methodsDict = [:]
        
        if let pMethods = methods {
            for method in pMethods {
                if let mId = method.payment_type_id{
                    methodsDict?[mId] = method
                }
            }
        }
        
    }
}
