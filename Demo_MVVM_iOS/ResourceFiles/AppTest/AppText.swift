//
//  AppText.swift
//  Demo_MVVM_iOS
//
//  Created by Aman Kumar on 10/02/24.
//

import Foundation
/// Manages the display and hiding of a loader using SwiftLoader.
final class AppText {
    /// Singleton instance of AppText.
    static let shared = AppText()
    
    internal let loadingTitle: String = "Loading..."
    internal let invalidResponseMessage: String = "🛑 Invalid response received."
    internal let invalidURLMessage: String = "🛑 Invalid URL."
    internal let connectivityErrorMessage: String = "🛑 Connectivity error."
    internal let networkErrorMessage: String = "🛑 Network error."
    
    internal let invalidResponseToast: String = "Invalid response received."
    internal let invalidURLToast: String = "🔗 Invalid URL."
    internal let connectivityErrorToast: String = "📵 Connectivity error."
    internal let networkErrorToast: String = "🛑 Network error."
    
    internal let passResponseMessage: String = "✅ Valid response received."
    internal let passURLMessage: String = "✅ Valid URL."
    internal let connectivityPassMessage: String = "✅ Valid Connectivity."
    internal let networkPassMessage: String = "✅ Valid Network."
    
    // APP SPECIFIC
    internal let appName: String = "Demo MVVM iOS"
    internal let cityWeatherAddedToast: String = "City's weather added in list successfully."
    internal let cityWeatherSettingChangedToast: String = "City's weather setting changed successfully."
    internal let cityAddLoadingTitle: String = "Adding city..."
}
