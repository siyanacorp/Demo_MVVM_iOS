//
//  ReachabilityTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 28/02/24.
//

import XCTest
import Network
@testable import Demo_MVVM_iOS

class ReachabilityTests: XCTestCase {
    
    // SetUp function for setup class before test
    override class func setUp() {
        super.setUp()
    }
    
    // Test case to check internet connectivity when device is connected.
    func testInternetConnectivityWhenConnected() {
        // Given
        let reachability = Reachability.shared
        let expectation = XCTestExpectation(description: "Internet connectivity check")
        
        // When
        var isConnected = false
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "NetworkMonitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            } else {
                isConnected = false
            }
            expectation.fulfill()
        }
        monitor.start(queue: queue)
        
        // Then
        wait(for: [expectation], timeout: 5) // Adjust timeout if needed
        XCTAssertTrue(isConnected, "Internet connectivity should be true when device is connected.")
    }

    
    // Test case to check internet connectivity when device is disconnected.
    func testInternetConnectivityWhenDisconnected() {
        // Given
        let reachability = Reachability.shared
        let monitor = NWPathMonitor()
        
        // When
        var isConnected = false
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                isConnected = true
            } else {
                isConnected = false
            }
        }
        monitor.start(queue: DispatchQueue(label: "NetworkMonitor"))
        
        // Then
        XCTAssertFalse(isConnected, "Internet connectivity should be false when device is disconnected.")
    }
    
    // Tear down function for end all instance class after test
    override class func tearDown() {
        super.tearDown()
    }
}
