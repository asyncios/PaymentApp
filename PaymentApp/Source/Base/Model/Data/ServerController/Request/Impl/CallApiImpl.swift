//
//  CallApiImpl.swift
//  PaymentApp
//
//  Created by Nisum on 2/27/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class CallApiImpl: CallApiProtocol {
    var functionOnStart: () -> Void!
    var functionOnComplete: (String) -> Void!
    var functionOnError: (PaymentError) -> Void!
    
    required init(functionOnStart: @escaping () -> Void!,functionOnComplete: @escaping (String) -> Void!,functionOnError:@escaping (PaymentError) -> Void!)
    {
        self.functionOnStart = functionOnStart
        self.functionOnComplete = functionOnComplete
        self.functionOnError = functionOnError
    }
    func onStart()
    {
        functionOnStart()
    }
    func onComplete(response: String)
    {
        functionOnComplete(response)
    }
    func onError(error:PaymentError)
    {
        functionOnError(error)
    }
}

class CallDataApiImpl : CallDataApiProtocol
{
    var functionOnStart: () -> Void!
    var functionOnComplete: (Data) -> Void!
    var functionOnError: (PaymentError) -> Void!
    
    required init(functionOnStart: @escaping () -> Void!,functionOnComplete: @escaping (Data) -> Void!,functionOnError:@escaping (PaymentError) -> Void!)
    {
        self.functionOnStart = functionOnStart
        self.functionOnComplete = functionOnComplete
        self.functionOnError = functionOnError
    }
    func onStart()
    {
        functionOnStart()
    }
    func onComplete(response: Data)
    {
        functionOnComplete(response)
    }
    func onError(error:PaymentError)
    {
        functionOnError(error)
    }
    
}
