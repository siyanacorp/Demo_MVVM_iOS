//
//  ViewToViewModelViewCTests.swift
//  Demo_MVVM_iOSTests
//
//  Created by Aman Kumar on 03/03/24.
//

import XCTest

@testable import Demo_MVVM_iOS // Replace YourModuleName with the actual module name

class ViewToViewModelViewCTests: XCTestCase {
    
    var sut: ViewToViewModelViewC?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Bindings", bundle: nil)
        guard let sutS = storyboard.instantiateViewController(withIdentifier: ViewToViewModelViewC.className) as? ViewToViewModelViewC else{
            fatalError("NO ViewToViewModelViewC FOUND...!")
        }
        self.sut = sutS
        self.sut?.loadViewIfNeeded()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func testViewModelBinding() {
        // Test if view controller's text fields are properly bound to the view model
        // Simulate user input
        self.sut?.textFieldUserName.text = "testUser"
        self.sut?.textFieldPassword.text = "testPassword"
        
        // Trigger text field change events
        self.sut?.textFieldUserName.sendActions(for: .editingChanged)
        self.sut?.textFieldPassword.sendActions(for: .editingChanged)
        
        // Check if the view model values are updated
        XCTAssertEqual(self.sut?.loginVM.username.value, "testUser")
        XCTAssertEqual(self.sut?.loginVM.password.value, "testPassword")
    }
    
    func testPassTextField_WhenCreated_HasPasswordContentTypeSet() throws {
        let passwordTextField = try XCTUnwrap(sut?.textFieldPassword, "Password text field not connected")
        
        XCTAssertEqual(passwordTextField.textContentType, .password,"Password text field does not have an password content type.")
    }
    
    
    func testPasswordTextField_WhenCreated_HasPasswordKeyBoardTypeSet() throws {
        let passwordTextField = try XCTUnwrap(sut?.textFieldPassword, "Password text field not connected")
        
        XCTAssertEqual(passwordTextField.keyboardType, UIKeyboardType.default,"Password text field does not have an default keyboard type.")
    }
    
    func testPasswordTextField_WhenCreated_HasSecureTextEntryTextField() throws {
        let passwordTextField = try XCTUnwrap(sut?.textFieldPassword, "Password text field not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry,"Password text field is not secure entry textfield.")
    }
    
    func testPasswordTextField_WhenCreated_HasPasswordPlaceholderSet() throws {
        // Attempt to unwrap the password text field
        let passwordTextField = try XCTUnwrap(sut?.textFieldPassword, "Password text field not connected")
        
        // Check if the placeholder is set correctly
        XCTAssertEqual(passwordTextField.placeholder, "Enter password", "Password text field does not have the correct placeholder")
    }

    
    
    // OPEN WHEN HAVING EMAIL TEXTFIELD
    /*
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut?.textFieldUserName, "Email address not connected")
        
        XCTAssertEqual(emailTextField.textContentType, .emailAddress,"Email address text field does not have an email address content type.")
    }
     
     func testEmailTextField_WhenCreated_HasEmailAddressKeyBoardTypeSet() throws {
         let emailTextField = try XCTUnwrap(sut?.textFieldUserName, "Email address not connected")
         
         XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress,"Email address text field does not have an email address keyboard type.")
     }
     */
    
    
    
     
    
    // Add more test cases to cover other functionalities if needed
    
}
