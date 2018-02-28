//
//  PaymentMethodDao.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol PaymentMethodDao {
    func getPaymentMethods() -> [PaymentMethod]?
    func getPaymentMethod(paymentMethodId: String) -> PaymentMethod?
    func setPaymentMethods(methods: [PaymentMethod]?)
}
