//
//  MarvelSuperHeroListViewCTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Aman Kumar on 03/03/24.
//

import XCTest
@testable import Demo_MVVM_iOS

final class MarvelSuperHeroListViewCTests: XCTestCase {
    
    var sut: MarvelSuperHeroListViewC?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "SuperHeros", bundle: nil)
        guard let sutS = storyboard.instantiateViewController(withIdentifier: MarvelSuperHeroListViewC.className) as? MarvelSuperHeroListViewC else{
            fatalError("NO MarvelSuperHeroListViewC FOUND...!")
        }
        self.sut
        self.sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test viewDidLoad
    func testViewDidLoad_InitialSetup() {
        // Given
        
        // When
        self.sut?.viewDidLoad()
        
        // Then
        XCTAssertNotNil(self.sut?.tableView)
        XCTAssertNotNil(self.sut?.refreshControl)
        XCTAssertNotNil(self.sut?.superHeroVM)
        XCTAssertEqual(self.sut?.noDataFoundStackView.isHidden, true)
    }
    
    // MARK: - Test refreshData
    @MainActor func testRefreshData() {
        // Given
        self.sut?.superHeroVM.fetchSuperHeros()
        
        // When
        self.sut?.refreshData(UIButton())
        
        // Then
        XCTAssertNotNil(self.sut?.superHeroVM)
    }
    
    // MARK: - Test initialSetup
    func testInitialSetup() {
        // When
        self.sut?.initialSetup()
        
        // Then
        XCTAssertNotNil(self.sut?.tableView)
        XCTAssertNotNil(self.sut?.refreshControl)
        XCTAssertNotNil(self.sut?.superHeroVM)
        XCTAssertEqual(self.sut?.noDataFoundStackView.isHidden, true)
    }
    
    // MARK: - Test handleCombinePublishers
    @MainActor func testHandleCombinePublishers() {
        // Given
        self.sut?.superHeroVM.fetchSuperHeros()
        
        // When
        self.sut?.handleCombinePublishers()
        
        // Then
        XCTAssertNotNil(self.sut?.superHeroVM)
    }
    
    // Add more test cases as needed for other methods and functionalities
    
}
