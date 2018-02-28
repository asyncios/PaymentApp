//
//  InjectionRepository.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class InjectionRepository: NSObject {
    static let sharedInstance = InjectionRepository()
    
    var paymentMethodDao: PaymentMethodDao?
    
    func getPaymentRepository() -> PaymentRepository {
        let repo = PaymentRepositoryImpl.init(serviceApi: getRestServiceApi(), paymentMethodDao: getPaymentDao())
        return repo
    }
    
    private func getRestServiceApi() -> RestServiceApi {
        let api = RestServiceApiImpl.init(constantKeys: getPaymentConstantKeys())
        return api
    }
    
    private func getPaymentConstantKeys() -> PaymentAppConstantKeys {
        return PaymentAppConstantKeysImpl()
    }
    
    private func getPaymentDao() -> PaymentMethodDao {
        if let dao = paymentMethodDao {
            return dao
        }
        paymentMethodDao = PaymentMethodDaoInMemory()
        return paymentMethodDao!
    }
}
