//
//  PaymentMethodPresenter.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol PaymentMethodsViewProtocol
{
    func show(loading: Bool)
    func show(methods: [PaymentMethod])
    func show(error: String)
}

class PaymentMethodsPresenter: PaymentMethodsPresenterProtocol {
    
    let repository: PaymentRepository
    let delegate: PaymentMethodsViewProtocol
    
    init(delegate: PaymentMethodsViewProtocol, repository: PaymentRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getPaymentMethods() {
        self.repository.getPaymentMethods(start: {
            self.delegate.show(loading: true)
        }, completed: { (methods) in
            self.delegate.show(loading: false)
            self.delegate.show(methods: methods)
        }) { (msg) in
            self.delegate.show(loading: false)
            self.delegate.show(error: msg)
        }
    }
}
