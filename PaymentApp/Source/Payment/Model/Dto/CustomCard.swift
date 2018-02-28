//
//  CustomCard.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class CustomCard: NSObject {
    var card: String
    var month: String
    var year: String
    var cvc: String
    
    init(card: String, month: String, year: String, cvc: String) {
        self.card = card
        self.month = month
        self.year = year
        self.cvc = cvc
    }
}
