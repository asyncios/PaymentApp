//
//  RestServiceApi.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/24/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol RestServiceApi {
    func getPaymentMethods(start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
    func getCardIssuers(paymentMethod: String,start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
    func getInstallments(amount: Double, paymentMethod: String, issuer: String, start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
}
