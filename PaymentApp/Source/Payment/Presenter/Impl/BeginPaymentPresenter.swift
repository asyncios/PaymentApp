//
//  BeginPaymentPresenter.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/24/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol BeginPaymentViewProtocol{
    func show(value: Double)
    func show(error: String)
}

class BeginPaymentPresenter: BeginPaymentPresenterProtocol {
    
    let delegate: BeginPaymentViewProtocol
    
    init(delegate: BeginPaymentViewProtocol) {
        self.delegate = delegate
    }
    
    func applyAmount(string: String) {
        if let value = Double(string), value > 0 {
            self.delegate.show(value: value)
        }
        else{
            self.delegate.show(error: StringConstant.ERROR_PARSE_INT)
        }
    }
}
