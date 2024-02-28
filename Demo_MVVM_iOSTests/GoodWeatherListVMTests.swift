//
//  GoodWeatherListVMTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 19/02/24.
//

import XCTest
@testable import Demo_MVVM_iOS

struct Location {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class GoodWeatherListVMTests: XCTestCase {
    
    var weatherListVM: GoodWeatherListVM?
    
    override func setUp() {
        super.setUp()
        self.weatherListVM = GoodWeatherListVM()
    }
    
    override func tearDown() {
        self.weatherListVM = nil
        super.tearDown()
    }
    
    func testAddWeather() {
        
    }


    
    func testWeatherListEmpty() {
        let isWeatherListEmpty = self.weatherListVM?.weatherListEmpty() ?? Bool()
        XCTAssertTrue(isWeatherListEmpty, "Weather list should be empty initially")
    }
}
