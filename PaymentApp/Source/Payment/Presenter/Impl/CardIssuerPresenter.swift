//
//  CardIssuerPresenter.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol CardIssuerViewProtocol {
    func show(loading: Bool)
    func show(issuers: [CardIssuer])
    func show(error: String)
}

class CardIssuerPresenter: CardIssuerPresenterProtocol {
    
    let repository: PaymentRepository
    var delegate: CardIssuerViewProtocol?
    
    init(delegate: CardIssuerViewProtocol, repository: PaymentRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
    func getCardIssuers(paymentMethodId: String) {
        self.repository.getCardIssuers(paymentMethod: paymentMethodId, start: {
            self.delegate?.show(loading: true)
        }, completed: { (cardIssuers) in
            self.delegate?.show(loading: false)
            self.delegate?.show(issuers: cardIssuers)
        }) { (msg) in
            self.delegate?.show(loading: false)
            self.delegate?.show(error: msg)
        }
    }
}
