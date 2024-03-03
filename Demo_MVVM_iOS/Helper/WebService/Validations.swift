//
//  Validations.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 03/03/24.
//

import Foundation
class Validations {
    // TODO: IS FULL NAME VALID
    internal func isFullNameValid(_ fullName:String)->Bool {
        var returnValue = true
        if fullName.count < ValidationsConstant.fullNameMinLength || fullName.count > ValidationsConstant.fullNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: IS FIRST NAME VALID
    internal func isFirstNameValid(_ firstName:String)->Bool {
        var returnValue = true
        if firstName.count < ValidationsConstant.firstNameMinLength || firstName.count > ValidationsConstant.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: IS LAST NAME VALID
    internal func isLastNameValid(_ lastName:String)->Bool {
        var returnValue = true
        if lastName.count < ValidationsConstant.lastNameMinLength || lastName.count > ValidationsConstant.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: IS EMAIL VALID
    internal func isValidEmailFormat(_ email:String)->Bool {
        var returnValue = true
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if email.count < ValidationsConstant.emailMinLength || email.count > ValidationsConstant.emailMaxLength || !(NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)){
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: IS USER NAME VALID
    internal func isValiduserNameFormat(_ userName: String) -> Bool {
        var returnValue = true
        let userNameRegex = "^[a-zA-Z0-9_\\-!@#$%^&*()+={}\\[\\]|;:'\",.<>?\\/\\\\]{3,16}$"
        if userName.count < ValidationsConstant.userNameMinLength || userName.count > ValidationsConstant.userNameMaxLength || !(NSPredicate(format: "SELF MATCHES %@", userNameRegex).evaluate(with: userName)){
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: IS PASSWORD VALID
    func isValidPasssword(_ password: String) -> Bool {
        var returnValue = true
        let passwordRegEx = "^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}"
        if password.count < ValidationsConstant.passwordMinLength || password.count > ValidationsConstant.passwordMaxLength || !(NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: password)){
            returnValue = false
        }
        return returnValue
    }
    
    // TODO: DO PASSWORD MATCH
    func doPassswordMatch(_ password: String, _ repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
}
