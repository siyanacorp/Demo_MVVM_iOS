//
//  Demo_MVVM_iOSUITests.swift
//  Demo_MVVM_iOSUITests
//
//  Created by Jogender Singh on 07/02/24.
//

import XCTest

// To provide a description for Demo_MVVM_iOSUITests, you can include a comment block above the UI test class definition in the corresponding Swift file. Here's an example of how you can write a description for Demo_MVVM_iOSUITests:
final class Demo_MVVM_iOSUITests: XCTestCase {
    /**
     Setup with error
     * Put setup code here. This method is called before the invocation of each test method in the class.

     * In UI tests it is usually best to stop immediately when a failure occurs.
     continueAfterFailure = false

     * In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
     - Throws: `NSError`
     */
    override func setUpWithError() throws {}

    /**
     Tear down with error
     * Put teardown code here. This method is called after the invocation of each test method in the class.
     - Throws: `NSError`
     */
    override func tearDownWithError() throws {}

    /**
     Test example with error
     * UI tests must launch the application that they test.
     let app = XCUIApplication()
     app.launch()

     * Use XCTAssert and related functions to verify your tests produce the correct results.
     
     - Throws: `NSError`
     */
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    /**
     Test launch  performance
     if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
         * This measures how long it takes to launch your application.
         measure(metrics: [XCTApplicationLaunchMetric()]) {
             XCUIApplication().launch()
         }
     }
     - Throws: `NSError`
     */
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
