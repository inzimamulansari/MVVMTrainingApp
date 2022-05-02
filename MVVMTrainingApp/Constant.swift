//
//  Constant.swift
//  MVVMTrainingApp
//
//  Created by Apple on 18/04/22.
//

import Foundation
import UIKit
import SystemConfiguration


struct Constant {
    static let baseurl = "https://api.printful.com/countries"
    static let AlertMsg = "Your Device is not connected to internet so we're showing you offline data."
    static let noInternet = "No Internet"
    static let Internet = "Internet Connection is available"
}

struct CellIdentifiers {
    static let stateCell = "cell"
    static let DetailCityCell = "DetailCell"
}

struct Identifiers {
    static let CityDetailViewController = "CityDetailViewController"
}


public class Reachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}
