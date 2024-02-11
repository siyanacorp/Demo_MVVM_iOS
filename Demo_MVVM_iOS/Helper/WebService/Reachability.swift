//
//  Reachability.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
import Network

/// Singleton class for checking internet connectivity using the Network framework.
final class Reachability {
    /// Singleton instance of Reachability.
    static var shared = Reachability()
    private init() { }
    
    /**
     Checks internet connectivity asynchronously using the Network framework.
     
     - Returns: A boolean indicating whether the device is connected to the internet or not. It monitors network path updates and updates the connectivity status accordingly.
     */
    internal func checkInternetConnectivity() -> Bool {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        
        var isConnected = false
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            } else {
                isConnected = false
            }
        }
        monitor.start(queue: queue)
        return isConnected
    }
}
