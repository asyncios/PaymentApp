//
//  InstallmentPresenter.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol InstallmentViewProtocol {
    func show(loading: Bool)
    func show(installment: Installment)
    func show(error: String)
}

class InstallmentPresenter: InstallmentPresenterProtocol {
    let delegate: InstallmentViewProtocol
    let repository: PaymentRepository
    
    init(delegate: InstallmentViewProtocol, repository: PaymentRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getInstallments(amount: Double,paymentMethod: String, issuer: String) {
        self.repository.getInstallments(amount: amount,paymentMethod: paymentMethod, issuer: issuer, start: {
            self.delegate.show(loading: true)
        }, completed: { (installments) in
            self.delegate.show(loading: false)
            if let installment = installments.first{
                self.delegate.show(installment: installment)
            }
            else{
                self.delegate.show(error: StringConstant.ERROR_EMPTY)
            }
            
        }) { (msg) in
            self.delegate.show(loading: false)
            self.delegate.show(error: msg)
        }
    }
}
