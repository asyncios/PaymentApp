//
//  PaymentFlow.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class PaymentFlow: NSObject {
    
    static let sharedInstance = PaymentFlow()
    private var amount: Double?
    private var payment: PaymentMethod?
    private var cardIssuer: CardIssuer?
    private var payerCost: PayerCost?
    
    func startFlow(amount: Double){
        self.amount = amount
        self.payment = nil
        self.cardIssuer = nil
        self.payerCost = nil
    }
    
    func setPayment(payment: PaymentMethod){
        self.cardIssuer = nil
        self.payerCost = nil
        self.payment = payment
    }
    
    func setCardIssuer(cardIssuer: CardIssuer){
        self.payerCost = nil
        self.cardIssuer = cardIssuer
    }
    
    func setPayerCost(payerCost: PayerCost){
        self.payerCost = payerCost
    }
    
    func printFlow()->String {
        let amountString = "Amount: " + String.init(amount ?? 0.0) + "\n"
        let paymentString = "payment method: " + (payment?.name ?? "") + "\n"
        let issuerString = "bank: " + (cardIssuer?.name ?? "") + "\n"
        let installmentString = "Installment: " + (payerCost?.recommended_message ?? "")
        return amountString + paymentString + issuerString + installmentString
    }
}
