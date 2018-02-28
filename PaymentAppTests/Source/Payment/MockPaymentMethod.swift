//
//  MockPaymentMethod.swift
//  PaymentAppTests
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
@testable import PaymentApp

class MockPaymentMethodView: MockBaseView,PaymentMethodsViewProtocol {
    func show(loading: Bool) {
        callSpurious(callIdentifier: "show(_:loading)")
    }
    func show(methods: [PaymentMethod]) {
        callSpurious(callIdentifier: "show(_:methods)")
    }
    func show(error: String) {
        callSpurious(callIdentifier: "show(_:error)")
    }
}
