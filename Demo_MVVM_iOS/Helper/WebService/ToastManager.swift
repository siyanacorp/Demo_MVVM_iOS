//
//  ToastManager.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 11/02/24.
//

import Foundation
import Toast
import UIKit

/// Manages the display and hiding of a toast using ToastManager.
final class ToastManager {
    /// Singleton instance of ToastManager.
    static let shared = ToastManager()
    
    /**
     Initialization Method
     * private init(){} is a concise notation that prevents instances of a class from being created outside the class itself, often used in singleton patterns for centralized control. */
    private init() {}
    
    /**
     Displays a toast message with the specified content.

     - Parameters:
        - message: The message to be displayed in the toast.
     */
    internal func showToast(message: String) {
        let toast = Toast.text(message)
        toast.show()
    }
}
