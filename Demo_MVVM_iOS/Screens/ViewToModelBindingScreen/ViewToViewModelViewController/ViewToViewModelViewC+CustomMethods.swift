//
//  ViewToViewModelViewC+CustomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 16/02/24.
//

import Foundation
import UIKit
/// Contains custom methods specific to the ViewToViewModelViewC class.
extension ViewToViewModelViewC {
    /**
     Performs initial setup for the class.
     */
    internal func initialSetup() {
        self.handleCombinePublishers()
        self.bindViewModel()
    }
    
    /**
     Handles the combination of publishers to update the view model and reflect changes in the UI.
     
     This method listens to changes in the text fields' publishers, `textFieldUserName.textChanged` and `textFieldPassword.textChanged`, and updates the corresponding properties in the `loginVM` view model.
     
     - Note: This method binds the text field values to the `username` and `password` properties of the `loginVM` view model.
     
     - Important: Memory management is ensured by capturing `self` weakly to avoid retain cycles.
     
     - Requires: Proper initialization of `loginVM` and configuration of text field publishers.
     */
    private func handleCombinePublishers() {
        // Binding text field values to view model
        self.textFieldUserName.textChanged
            .sink { [weak self] text in
                guard let self = self else { return }
                self.loginVM.username.value = text
            }
            .store(in: &cancellables)
        
        self.textFieldPassword.textChanged
            .sink { [weak self] text in
                guard let self = self else { return }
                self.loginVM.password.value = text
            }
            .store(in: &cancellables)
    }
    
    /**
     - Description: This private function establishes a connection between the view model's username and password properties and the corresponding UI elements in the view. It sets up subscribers to observe changes in the username and password properties and updates the UI or triggers actions accordingly.
     
     - Note: The function uses Combine's `sink` method to receive and handle changes emitted by the view model's `username` and `password` publishers. It employs weak self to prevent retain cycles, ensuring that the view controller can be deallocated properly.
     
     - Important: It's assumed that the `loginVM` property refers to an instance of a view model that conforms to Combine's Publisher protocol, providing a way to observe changes in its properties.
     
     - Precondition: The view model's `username` and `password` properties must be published properties, enabling observation of their changes.
     
     - Postcondition: The UI elements associated with the username and password are updated or actions are performed in response to changes in the corresponding view model properties.
     
     - Returns: Void
     */
    private func bindViewModel() {
        self.loginVM.username.publisherValue
            .sink { [weak self] text in
                guard let self = self else { return }
                self.textFieldUserName.text = text
            }
            .store(in: &cancellables)
        
        self.loginVM.password.publisherValue
            .sink { [weak self] text in
                guard let self = self else { return }
                self.textFieldPassword.text = text
            }
            .store(in: &cancellables)
    }
}
