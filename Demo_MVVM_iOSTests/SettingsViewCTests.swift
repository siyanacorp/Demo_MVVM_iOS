//
//  SettingsViewCTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Aman Kumar on 03/03/24.
//

import XCTest
@testable import Demo_MVVM_iOS // Replace YourModuleName with the actual module name

final class SettingsViewCTests: XCTestCase {
    
    var sut: SettingsViewC?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "GoodWeather", bundle: nil)
        guard let sutS = storyboard.instantiateViewController(withIdentifier: SettingsViewC.className) as? SettingsViewC else{
            fatalError("NO SettingsViewC FOUND...!")
        }
        self.sut = sutS
        self.sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testInitialSetup() {
        XCTAssertNotNil(self.sut?.tableView, "Table view should not be nil")
        XCTAssertNotNil(self.sut?.noDataFoundStackView, "No data found stack view should not be nil")
    }
    
    func testNumberOfSections() {
        let numberOfSections = self.sut?.tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1, "Expected number of sections should be 1")
    }
    
    func testNumberOfRowsInSection() {
        if let tableView = self.sut?.tableView {
            let numberOfRows = self.sut?.tableView(tableView, numberOfRowsInSection: 0)
            XCTAssertEqual(numberOfRows, self.sut?.settingsVM.units.count, "Number of rows should match the number of units in the settings view model")
        }
    }
    
    // Add more test methods for other functionalities, such as cell configuration, button actions, etc.
}
