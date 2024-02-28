//
//  AddWeatherVMTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 28/02/24.
//

import XCTest
import Combine
@testable import Demo_MVVM_iOS

class AddWeatherVMTests: XCTestCase {
    
    var viewModel: AddWeatherVM?
    var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        viewModel = AddWeatherVM()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = []
    }
    
    @MainActor func testAddWeather_Success() throws {
        // Given
        let expectation = expectation(description: "Weather data fetched successfully")
        let cityName = "Mumbai"
        
        // When
        self.viewModel?.cityName = cityName
        self.viewModel?.addWeather()
        print("Fetching weather data for \(cityName)")
        
        // Then
        self.viewModel?.weatherTodayPublisher
            .sink { weatherToday in
                if let weatherData = weatherToday {
                    print("Received weather data: \(weatherData)")
                    // Check if the weather data is not nil
                    XCTAssertNotNil(weatherToday, "Weather data should not be nil")
                } else {
                    print("Failed to receive weather data")
                }
                // Add more assertions based on the response if needed
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    
    @MainActor func testAddWeather_Failure() throws {
        // Given
        let expectation = expectation(description: "Failed to fetch weather data")
        let cityName = "InvalidCityName"
        
        // When
        self.viewModel?.cityName = cityName
        self.viewModel?.addWeather()
        
        // Then
        self.viewModel?.weatherTodayPublisher
            .sink { weatherToday in
                // Check if the weather data is nil
                XCTAssertNil(weatherToday)
                // Add more assertions based on the error handling
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
