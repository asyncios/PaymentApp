//
//  InstallmentPresenterProtocol.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol InstallmentPresenterProtocol {
    func getInstallments(amount: Double,paymentMethod: String, issuer: String)
}
