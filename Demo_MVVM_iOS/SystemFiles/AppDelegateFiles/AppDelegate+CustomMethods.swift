//
//  AppDelegate+CustomMethods.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 16/02/24.
//

import FirebaseCore
import Foundation
import IQKeyboardManagerSwift
import UIKit

extension AppDelegate {
    /**
     - Description: This internal function configures the Firebase application and enables IQKeyboardManager to handle keyboard interactions within the application. IQKeyboardManager is a library used for managing keyboard behavior in iOS applications, ensuring smooth user experience by automatically handling keyboard appearance and dismissal.
     
     - Note: This function should be called within the application delegate's `application(_:didFinishLaunchingWithOptions:)` method to initialize essential components and settings before the application interface is presented to the user.
     
     - Parameters:
     - None
     
     - Returns: Void
     */
    internal func initialSetup() {
        FirebaseApp.configure()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
}
