//
//  Demo_MVVM_iOSUITestsLaunchTests.swift
//  Demo_MVVM_iOSUITests
//
//  Created by Jogender Singh on 07/02/24.
//

import XCTest
// To provide a description for Demo_MVVM_iOSUITestsLaunchTests, you can include a comment block above the test method definition in the corresponding Swift file. Here's an example of how you can write a description for Demo_MVVM_iOSUITestsLaunchTests:
final class Demo_MVVM_iOSUITestsLaunchTests: XCTestCase {
    /**
     Runs for each target application UIConfiguration
     - Returns: A boolean value (true/false) to tell if runs for each target application UIConfiguration */
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    /**
     Setup with error
     - Throws: `NSError`
     */
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /**
     Test launch
     * Insert steps here to perform after app launch but before taking a screenshot,
     * such as logging into a test account or navigating somewhere in the app
     - Throws: `NSError`
     */
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
