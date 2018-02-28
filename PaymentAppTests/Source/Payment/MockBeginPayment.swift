//
//  MockBeginPayment.swift
//  PaymentAppTests
//
//  Created by Nisum on 2/28/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit
@testable import PaymentApp

class MockBeginPaymentView: MockBaseView,BeginPaymentViewProtocol {
    func show(error: String) {
        callSpurious(callIdentifier: "show(_:string)")
    }
    func show(value: Double) {
        callSpurious(callIdentifier: "show(_:double)")
    }
}


