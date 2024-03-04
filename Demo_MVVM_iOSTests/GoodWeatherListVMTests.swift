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
    
    var viewModel: GoodWeatherListVM?
    
    override func setUp() {
        super.setUp()
        viewModel = GoodWeatherListVM()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testAddWeather() {
        // Given
        let weatherModel = GoodWeatherModel(location: nil, current: nil) // Create your sample weather model
        
        // When
        self.viewModel?.addWeather(cityWeather: GoodWeatherVM(weatherModel))
        
        // Then
        XCTAssertEqual(self.viewModel?.allCitiesWeather.count, 1, "Weather not added successfully")
    }
    
    func testNumberOfSections() {
        // Given
        let expectedSections = 1
        
        // When
        let numberOfSections = self.viewModel?.numberOfSections
        
        // Then
        XCTAssertEqual(numberOfSections, expectedSections, "Number of sections should be 1")
    }
    
    func testNumberOfRowsInSection() {
        // Given
        let weatherModel1 = GoodWeatherModel(location: nil, current: nil)
        let weatherModel2 = GoodWeatherModel(location: nil, current: nil)
        self.viewModel?.addWeather(cityWeather: GoodWeatherVM(weatherModel1))
        self.viewModel?.addWeather(cityWeather: GoodWeatherVM(weatherModel2))
        
        // When
        let numberOfRows = self.viewModel?.numberOfRowsInSection(0)
        
        // Then
        XCTAssertEqual(numberOfRows, 2, "Number of rows should be 2")
    }
    
    // You can write more tests for other methods as needed
}
