//
//  SettingsVMTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Jogender Singh on 19/02/24.
//

import XCTest
@testable import Demo_MVVM_iOS

class SettingsVMTests: XCTestCase {
    var settingsVM: SettingsVM!
    
    override func setUp() {
        super.setUp()
        settingsVM = SettingsVM()
        // Ensure default unit is set to Celcius for each test case
        settingsVM.selectedUnit = .celcius
    }
    
    override func tearDown() {
        settingsVM = nil
        super.tearDown()
    }
    
    func testDefaultSelectedUnit() {
        XCTAssertEqual(settingsVM.selectedUnit, Unit.celcius)
    }
    
    func testChangingSelectedUnit() {
        settingsVM.selectedUnit = .fahrenheit
        XCTAssertEqual(settingsVM.selectedUnit, Unit.fahrenheit)
    }
    
    func testInitialValueOfSelectedUnitPublisher() {
        let expectation = XCTestExpectation(description: "Initial value of selected unit publisher expectation")
        
        let cancellable = settingsVM.selectedUnitPublisher
            .sink { unit in
                XCTAssertEqual(unit, Unit.celcius)
                expectation.fulfill()
            }
        
        wait(for: [expectation], timeout: 1.0)
        
        cancellable.cancel()
    }

    func testSelectedUnitPublisher() {
        // Initialize settingsVM with initial value .fahrenheit
        settingsVM.selectedUnit = .fahrenheit
        
        let expectation = XCTestExpectation(description: "Unit publisher expectation")
        
        let cancellable = settingsVM.selectedUnitPublisher
            .sink { unit in
                XCTAssertEqual(unit, Unit.fahrenheit)
                expectation.fulfill()
            }
        
        settingsVM.selectedUnit = .fahrenheit
        
        wait(for: [expectation], timeout: 1.0)
        
        cancellable.cancel()
    }


    
    func testNumberOfSections() {
        XCTAssertEqual(settingsVM.numberOfSections, 1)
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(settingsVM.numberOfRowsInSection(0), Unit.allCases.count)
    }
    
    func testSettingAtIndex() {
        let setting = settingsVM.settingAtIndex(0)
        XCTAssertNotNil(setting)
        XCTAssertEqual(setting?.unit, Unit.celcius)
        XCTAssertTrue(setting?.isSelected ?? false)
    }
    
    func testSettingListEmpty() {
        XCTAssertFalse(settingsVM.settingListEmpty())
    }
}
