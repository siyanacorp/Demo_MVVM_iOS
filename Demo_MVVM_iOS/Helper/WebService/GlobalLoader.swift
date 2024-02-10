//
//  GlobalLoader.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import SwiftLoader
import Foundation
import UIKit

/// Manages the display and hiding of a loader using SwiftLoader.
final class GlobalLoader {
    /// Singleton instance of GlobalLoader.
    static let shared = GlobalLoader()
    
    /**
     Initialization Method
     * private init(){} is a concise notation that prevents instances of a class from being created outside the class itself, often used in singleton patterns for centralized control. */
    private init() { }
    
    /**
     Displays a loader with the specified title using SwiftLoader.
     
     - Parameters:
     - title: The title to be displayed on the loader.
     */
    internal func showLoader(title: String?) {
        var config: SwiftLoader.Config = SwiftLoader.Config()
        config.size = 100
        config.backgroundColor = UIColor(red:0.03, green:0.82, blue:0.7, alpha:1)
        config.spinnerColor = .white
        config.titleTextColor = .white
        config.spinnerLineWidth = 2.0
        config.foregroundColor = UIColor.black
        config.foregroundAlpha = 0.5
        
        SwiftLoader.setConfig(config)
        
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        if scene.windows.first != nil {
            SwiftLoader.show(title: title, animated: true)
            
        }
    }
    
    /**
     Hides the currently displayed loader.
     */
    internal func hideLoader() {
        SwiftLoader.hide()
    }
}
