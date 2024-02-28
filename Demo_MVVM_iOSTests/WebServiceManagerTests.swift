//
//  WebServiceManagerTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 28/02/24.
//

import XCTest
@testable import Demo_MVVM_iOSTests // Replace YourModuleName with the actual module name

class WebServiceManagerTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Test Cases
    
    func testValidRequest() async {
        // Given
        let manager = WebServiceManager.shared
        let validResource: Resource<[MarvelSuperHeroModel]> = {
            let urlString = "https://simplifiedcoding.net/demos/marvel/"
            var resource = Resource<[MarvelSuperHeroModel]>(url: urlString)
            resource.httpMethod = HttpMethod.get
            resource.body = nil
            return resource
        }()
        
        // Create an expectation for the asynchronous call
        let expectation = XCTestExpectation(description: "Valid request expectation")
        
        // When
        do {
            let result: [MarvelSuperHeroModel] = try await manager.request(resource: validResource)
            // Then
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
        
        // Wait for the expectation to be fulfilled within a certain timeout
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testInvalidURL() async {
        // Given
        let manager = WebServiceManager.shared
        
        // Prepare an invalid resource with an invalid URL
        let invalidResource: Resource<[MarvelSuperHeroModel]> = Resource(url: "invalid-url", httpMethod: .get)
        // Create an expectation for the asynchronous call
        let expectation = XCTestExpectation(description: "Invalid URL request expectation")
        // When & Then
        do {
            // Attempt to make an asynchronous request with the invalid URL
            let result: [MarvelSuperHeroModel] = try await manager.request(resource: invalidResource)
            
            // If the request doesn't throw an error, it's invalid
            XCTFail("The request should throw an error for an invalid URL.")
        } catch {
            // Check the actual type of the error
            XCTAssertNotNil(error, "Error should not be nil")
            print("Error type: \(type(of: error))")
            
            // Check that the error type is compatible with DataError
            XCTAssertFalse(error is DataError, "Error should be of type DataError")
            // Add any additional checks or debugging information here
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    
    
    func testFailedRequestDueToConnectivity() async {
        // Given
        let manager = WebServiceManager.shared
        
        let resourceWithConnectivityError: Resource<[MarvelSuperHeroModel]> = Resource(url: "https://simplifiedcoding.net/demos/marvel/", httpMethod: .get)
        
        
        
        // Create an expectation for the asynchronous call
        let expectation = XCTestExpectation(description: "Failed request due to connectivity")
        
        // When & Then
        do {
            // Attempt to make an asynchronous request with a resource that triggers connectivity error
            let result: [MarvelSuperHeroModel] = try await manager.request(resource: resourceWithConnectivityError)
            
            // If the request doesn't throw an error, it should have failed due to connectivity issues
            XCTFail("The request should have thrown an error due to connectivity issues.")
        } catch {
            XCTAssertNotNil(error, "Error should not be nil")
            print("Error type: \(type(of: error))")
            
            // Check that the error type is compatible with connectivity errors
            // Assuming DataError represents a connectivity issue, adjust as per your error handling
            XCTAssertFalse(error is DataError, "Error should be of type DataError")
            // Add any additional checks or debugging information here
            
            expectation.fulfill()
        }
        
        // Wait for the expectation to be fulfilled within a certain timeout
        wait(for: [expectation], timeout: 5.0)
    }
    
    // Add more test cases as needed...
}
