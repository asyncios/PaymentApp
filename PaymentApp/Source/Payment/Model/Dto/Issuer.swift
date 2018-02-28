//
//  Issuer.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class Issuer: NSObject {
    var issuerId: String?
    var name: String?
    var secure_thumbnail: String?
    var thumbnail: String?
    
    init(dict: [String: Any?]) {
        if let value = dict["id"] {
            issuerId = value as? String
        }
        if let value = dict["name"] {
            name = value as? String
        }
        if let value = dict["secure_thumbnail"] {
            secure_thumbnail = value as? String
        }
        if let value = dict["thumbnail"] {
            thumbnail = value as? String
        }
    }
}
