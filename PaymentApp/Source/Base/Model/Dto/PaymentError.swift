//
//  PaymentError.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol PaymentError {
    var code:Int? {get set}
    var name:String? {get set}
    var message:String {get set}
    var errorFields: [PaymentError] {get set}
    var otherMessages:NSArray? {get set}
}
