//
//  ReachabilityProtocolImpl.swift
//  PaymentApp
//
//  Created by josue cadillo on 2/26/18.
//  Copyright © 2018 josue cadillo. All rights reserved.
//

import UIKit

class ReachabilityProtocolImpl: ReachabilityProtocol {
    
    static let sharedInstance = ReachabilityProtocolImpl()
    
    func isConnect()->Bool
    {
        var flag = true
        let hostReachability = Reachability.forInternetConnection;
        let netStatus:NetworkStatus = hostReachability().currentReachabilityStatus();
        switch (netStatus)
        {
        case NotReachable:
            flag = false;
            break
        case ReachableViaWWAN:
            break
        case ReachableViaWiFi:
            break
        default:
            break
        }
        return flag;
    }
}
