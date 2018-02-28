//
//  PaymentRepository.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol PaymentRepository {
    func getPaymentMethods(start: @escaping ()->Void, completed: @escaping ([PaymentMethod])->Void, error: @escaping (String)->Void)
    func getCardIssuers(paymentMethod: String,start: @escaping ()->Void, completed: @escaping ([CardIssuer])->Void, error: @escaping (String)->Void)
    func getInstallments(amount: Double, paymentMethod: String, issuer: String,start: @escaping ()->Void, completed: @escaping ([Installment])->Void, error: @escaping (String)->Void)
    
}
