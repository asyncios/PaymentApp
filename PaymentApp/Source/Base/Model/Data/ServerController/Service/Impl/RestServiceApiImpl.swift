//
//  RestServiceApiImpl.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/24/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class RestServiceApiImpl: RestServiceApi {
    
    enum uri: String {
        case paymentMethod = "https://api.mercadopago.com/v1/payment_methods"
        case cardIssuer = "https://api.mercadopago.com/v1/payment_methods/card_issuers"
        case installements = "https://api.mercadopago.com/v1/payment_methods/installments"
    }
    
    let constantKeys: PaymentAppConstantKeys
    
    init(constantKeys: PaymentAppConstantKeys) {
        self.constantKeys = constantKeys
    }
    
    func getPaymentMethods(start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
    {
        let path = (constantKeys.getRestKey()).addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let url = uri.paymentMethod.rawValue + "?public_key=" + path
        let callApi = AlamoFireCallApi.init()
        callApi.setUrl(url: url)
        let apiImpl = CallApiImpl.init(functionOnStart: start, functionOnComplete: completed, functionOnError: error)
        callApi.execute(delegate: apiImpl)
    }
    
    func getCardIssuers(paymentMethod: String,start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
    {
        let path = (constantKeys.getRestKey() + "&payment_method_id=" + paymentMethod).addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let url = uri.cardIssuer.rawValue + "?public_key=" + path
        let callApi = AlamoFireCallApi.init()
        callApi.setUrl(url: url)
        let apiImpl = CallApiImpl.init(functionOnStart: start, functionOnComplete: completed, functionOnError: error)
        callApi.execute(delegate: apiImpl)
    }
    
    func getInstallments(amount: Double, paymentMethod: String, issuer: String, start: @escaping ()->Void, completed: @escaping (String)->Void, error: @escaping (PaymentError)->Void)
    {
        let path = (constantKeys.getRestKey() + "&amount=" + String.init(amount) + "&payment_method_id=" + paymentMethod + "&issuer.id="+issuer).addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let url = uri.installements.rawValue + "?public_key=" + path
        let callApi = AlamoFireCallApi.init()
        callApi.setUrl(url: url)
        let apiImpl = CallApiImpl.init(functionOnStart: start, functionOnComplete: completed, functionOnError: error)
        callApi.execute(delegate: apiImpl)
    }
}
