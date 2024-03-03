//
//  ValidationsTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Aman Kumar on 03/03/24.
//

import XCTest
@testable import Demo_MVVM_iOS // Import your app module
final class  ValidationsTests: XCTestCase {
    
    var validations: Validations?
    
    override func setUp() {
        super.setUp()
        self.validations = Validations()
    }
    
    override func tearDown() {
        self.validations = nil
        super.tearDown()
    }
    
    func testIsFullNameValid() {
        XCTAssertTrue(self.validations?.isFullNameValid("John Doe") ?? Bool(), "Full name should be valid")
        XCTAssertFalse(self.validations?.isFullNameValid("") ?? Bool(), "Empty full name should be invalid")
        XCTAssertFalse(self.validations?.isFullNameValid("John Doe John Doe John Doe") ?? Bool(), "Long full name should be invalid")
    }
    
    func testIsFirstNameValid() {
        XCTAssertTrue(self.validations?.isFirstNameValid("John") ?? Bool(), "First name should be valid")
        XCTAssertFalse(self.validations?.isFirstNameValid("") ?? Bool(), "Empty first name should be invalid")
        XCTAssertFalse(self.validations?.isFirstNameValid("JohnJohnJohnJohn") ?? Bool(), "Long first name should be invalid")
    }
    
    func testIsLastNameValid() {
        XCTAssertTrue(self.validations?.isLastNameValid("Doe") ?? Bool(), "Last name should be valid")
        XCTAssertFalse(self.validations?.isLastNameValid("") ?? Bool(), "Empty last name should be invalid")
        XCTAssertFalse(self.validations?.isLastNameValid("DoeDoeDoeDoeDoeDoe") ?? Bool(), "Long last name should be invalid")
    }
    
    func testIsValidEmailFormat() {
        XCTAssertTrue(self.validations?.isValidEmailFormat("john.doe@example.com") ?? Bool(), "Valid email format should pass")
        XCTAssertFalse(self.validations?.isValidEmailFormat("john.doe@example") ?? Bool(), "Invalid email format should fail")
    }
    
    func testIsValiduserNameFormat() {
        XCTAssertTrue(self.validations?.isValiduserNameFormat("john_doe") ?? Bool(), "Valid username format should pass")
      //  XCTAssertFalse(self.validations?.isValiduserNameFormat("johndoe") ?? Bool(), "Invalid username format should fail")
    }
    
    func testIsValidPassword() {
        XCTAssertTrue(self.validations?.isValidPasssword("Password1") ?? Bool(), "Valid password should pass")
        XCTAssertFalse(self.validations?.isValidPasssword("password") ?? Bool(), "Invalid password (no uppercase or number) should fail")
    }
    
    func testDoPasswordMatch() {
        XCTAssertTrue(self.validations?.doPassswordMatch("Password1", "Password1") ?? Bool(), "Matching passwords should return true")
        XCTAssertFalse(self.validations?.doPassswordMatch("Password1", "password1") ?? Bool(), "Non-matching passwords should return false")
    }
}
