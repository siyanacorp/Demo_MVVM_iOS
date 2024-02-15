//
//  AddCityScreenViewC+UITextFieldDelegate.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 14/02/24.
//

import Foundation
import UIKit
extension AddCityScreenViewC: UITextFieldDelegate{
    // TODO: TEXT FIELD SHOULD BEGIN EDITING
    // Return true if editing should begin
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // TODO: TEXT FIELD DID BEGIN EDITING
    // Called when editing begins
    func textFieldDidBeginEditing(_ textField: UITextField) { }
    
    // TODO: TEXT FIELD SHOULD END EDITING
    // Return true if editing should end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // TODO: TEXT FIELD DID END EDITING
    // Called when editing ends
    func textFieldDidEndEditing(_ textField: UITextField) { }
    
    // TODO: TEXT FIELD SHOULD END EDITING
    // Called when editing ends, specifying the reason
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) { }
    
    // TODO: TEXT FIELD SHOULD CLEAR
    // Return true if the text should be cleared
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.addWeatherVM.cityName = String()
        return true
    }
    
    // TODO: TEXT FIELD SHOULD RETURN
    // Return true if the return button should do something
    // For example, you might call resignFirstResponder() to dismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    // TODO: TEXT FIELD SHOULD CHANGE CHARACTERS IN RANGE
    // Return true if the text should be changed
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        textField.text = newString
        self.addWeatherVM.cityName = textField.text ?? String()
        return false
    }
}
