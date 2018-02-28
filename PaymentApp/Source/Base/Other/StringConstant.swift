//
//  StringConstant.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class StringConstant: NSObject {
    
    static let APP_NAME = "Payment App"
    static let ERROR_PROBLEM_SYNCRONIZE = NSLocalizedString("Problema al sincronizar información, por favor vuelve a intentarlo...", comment: "")
    static let ERROR_UNKNOWN = NSLocalizedString("Ha ocurrido un error desconocido, por favor inténtalo nuevamente o más tarde", comment: "")
    static let ERROR_TOO_MANY_REQUESTS = NSLocalizedString("Por el momento este servicio no está habilitado, intenta nuevamente más tarde", comment: "")
    static let ERROR_PARSE_INT = NSLocalizedString("Monto invalido", comment: "")
    static let ERROR_EMPTY = NSLocalizedString("No hay elementos disponibles", comment: "")
    
}
