//
//  RequestCallApi.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

protocol CallApiProtocol
{
    func onStart()
    func onComplete(response: String)
    func onError(error:PaymentError)
}

protocol CallDataApiProtocol
{
    func onStart()
    func onComplete(response: Data)
    func onError(error:PaymentError)
}

protocol RequestCallApi
{
    func setUrl(url: String)
    func setParameters(parameters:[String:Any])
    func setCache(cache:Int)
    func execute(delegate:CallApiProtocol)
}
