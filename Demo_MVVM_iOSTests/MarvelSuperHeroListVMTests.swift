//
//  MarvelSuperHeroListVMTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 28/02/24.
//

import XCTest
@testable import Demo_MVVM_iOS

class MarvelSuperHeroListVMTests: XCTestCase {
    
    var viewModel: MarvelSuperHeroListVM?

    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = MarvelSuperHeroListVM()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.viewModel = nil
    }

    @MainActor func testFetchSuperHeros() {
        // Given
        let expectation = expectation(description: "Fetch superheroes")
        
        // When
        self.viewModel?.fetchSuperHeros()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel?.superHeros, "Superheroes should not be nil after fetching")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    // Other test cases...
}
