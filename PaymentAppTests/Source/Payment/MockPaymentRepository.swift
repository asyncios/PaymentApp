//
//  MockPaymentRepository.swift
//  PaymentAppTests
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
@testable import PaymentApp

class MockPaymentRepositorySuccess: PaymentRepository,SpuriousTestable {
    func getPaymentMethods(start: @escaping () -> Void, completed: @escaping ([PaymentMethod]) -> Void, error: @escaping (String) -> Void) {
        var methods: [PaymentMethod] = []
        var dict: [String: Any?] = [:]
        dict["id"] = "visa"
        dict["name"] = "visa"
        methods.append(PaymentMethod.init(dict: dict))
        completed(methods)
    }
    
    func getCardIssuers(paymentMethod: String, start: @escaping () -> Void, completed: @escaping ([CardIssuer]) -> Void, error: @escaping (String) -> Void) {
        var cards: [CardIssuer] = []
        var dict: [String: Any?] = [:]
        dict["id"] = "288"
        dict["name"] = "Tarjeta Shopping"
        cards.append(CardIssuer.init(dict: dict))
        completed(cards)
    }
    
    func getInstallments(amount: Double, paymentMethod: String, issuer: String, start: @escaping () -> Void, completed: @escaping ([Installment]) -> Void, error: @escaping (String) -> Void) {
        var installments: [Installment] = []
        var dict: [String: Any?] = [:]
        dict["payment_method_id"] = "visa"
        dict["payment_type_id"] = "credit_card"
        installments.append(Installment.init(dict: dict))
        completed(installments)
    }
}

class MockPaymentRepositoryError: PaymentRepository,SpuriousTestable {
    func getPaymentMethods(start: @escaping () -> Void, completed: @escaping ([PaymentMethod]) -> Void, error: @escaping (String) -> Void) {
        error(StringConstant.ERROR_UNKNOWN)
    }
    func getCardIssuers(paymentMethod: String, start: @escaping () -> Void, completed: @escaping ([CardIssuer]) -> Void, error: @escaping (String) -> Void) {
        error(StringConstant.ERROR_UNKNOWN)
    }
    func getInstallments(amount: Double, paymentMethod: String, issuer: String, start: @escaping () -> Void, completed: @escaping ([Installment]) -> Void, error: @escaping (String) -> Void) {
        error(StringConstant.ERROR_UNKNOWN)
    }
}
