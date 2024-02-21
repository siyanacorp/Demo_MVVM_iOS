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
    
    var WeatherListVM: GoodWeatherListVM!
    
    override func setUp() {
        super.setUp()
        WeatherListVM = GoodWeatherListVM()
    }
    
    override func tearDown() {
        WeatherListVM = nil
        super.tearDown()
    }
    
    func testAddWeather() {
        
    }


    
    func testWeatherListEmpty() {
        let isWeatherListEmpty = WeatherListVM.weatherListEmpty()
        
        XCTAssertTrue(isWeatherListEmpty, "Weather list should be empty initially")
    }
}
