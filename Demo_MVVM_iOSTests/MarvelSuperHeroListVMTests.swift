//
//  MarvelSuperHeroListVMTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 28/02/24.
//

import XCTest
@testable import Demo_MVVM_iOS

class MarvelSuperHeroListVMTests: XCTestCase {
    
    var viewModel: MarvelSuperHeroListVM!

    override func setUpWithError() throws {
        viewModel = MarvelSuperHeroListVM()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    @MainActor func testFetchSuperHeros() {
        // Given
        let expectation = expectation(description: "Fetch superheroes")
        
        // When
        viewModel.fetchSuperHeros()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.superHeros, "Superheroes should not be nil after fetching")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    // Other test cases...
}
