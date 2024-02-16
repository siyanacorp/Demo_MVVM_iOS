//
//  AppDelegate.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 07/02/24.

import FirebaseCore
import UIKit

/// The AppDelegate class in an iOS application serves as the entry point and central coordinator for the application's lifecycle events. It's responsible for initializing the app, responding to system events such as app launch, termination, backgrounding, and foregrounding, as well as handling state transitions.
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    /**
     Application did finish launching with options
     * Override point for customization after application launch
     
     - Parameter application: Main application reference
     - Parameter launchOptions: Application launch options Keys
     - Returns: A boolean value (true/false) to tell if application is launched successfully with options. */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initialSetup()
        return true
    }
    
    /**
     Application configuration for connecting
     * Called when a new scene session is being created.
     * Use this method to select a configuration to create the new scene with.
     
     - Parameter application: Main application reference
     - Parameter connectingSceneSession: UIScene session
     - Parameter options: UIScene connection options
     - Returns: UIScene configuration  */
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    /**
     Application did discard scene sessions
     * Called when the user discards a scene session.
     * If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
     * Use this method to release any resources that were specific to the discarded scenes, as they will not return.
     
     - Parameter application: Main application reference
     - Parameter sceneSessions: Set UIScene session */
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
