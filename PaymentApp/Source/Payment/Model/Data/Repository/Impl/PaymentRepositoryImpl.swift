//
//  PaymentRepositoryImpl.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentRepositoryImpl: PaymentRepository {
    let serviceApi: RestServiceApi
    let paymentMethodDao: PaymentMethodDao
    
    init(serviceApi: RestServiceApi, paymentMethodDao: PaymentMethodDao) {
        self.serviceApi = serviceApi
        self.paymentMethodDao = paymentMethodDao
    }
    
    func getPaymentMethods(start: @escaping ()->Void, completed: @escaping ([PaymentMethod])->Void, error: @escaping (String)->Void)
    {
        self.serviceApi.getPaymentMethods(start: {
            start()
        }, completed: { (response) in
            if let methods = PaymentParser.parsePaymentMethods(response: response){
                completed(methods)
            }
            else{
                error(StringConstant.ERROR_UNKNOWN)
            }
        }) { (paymentError) in
            error(paymentError.message)
        }
    }
    
    func getCardIssuers(paymentMethod: String,start: @escaping ()->Void, completed: @escaping ([CardIssuer])->Void, error: @escaping (String)->Void)
    {
        self.serviceApi.getCardIssuers(paymentMethod: paymentMethod, start: {
            start()
        }, completed: { (response) in
            if let methods = PaymentParser.parseCardIssuers(response: response){
                completed(methods)
            }
            else{
                error(StringConstant.ERROR_UNKNOWN)
            }
        }) { (paymentError) in
            error(paymentError.message)
        }
    }
    
    func getInstallments(amount: Double, paymentMethod: String, issuer: String,start: @escaping ()->Void, completed: @escaping ([Installment])->Void, error: @escaping (String)->Void)
    {
        self.serviceApi.getInstallments(amount: amount,paymentMethod: paymentMethod, issuer: issuer, start: {
            start()
        }, completed: { (response) in
            if let installments = PaymentParser.parseInstallments(response: response){
                completed(installments)
            }
            else{
                error(StringConstant.ERROR_UNKNOWN)
            }
        }) { (paymentError) in
            error(paymentError.message)
        }
    }
}
