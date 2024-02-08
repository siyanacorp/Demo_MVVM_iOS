//
//  SceneDelegate.swift
//  Demo_MVVM_iOS
//
//  Created by Jogender Singh on 07/02/24.
//

import UIKit

/// The Scene Delegate is a crucial component introduced in iOS 13 to manage the lifecycle of multiple scenes in an iOS app, including windows and views. It acts as a coordinator for interactions between the app and the system, allowing for the creation, modification, and destruction of scenes as needed. Here's a detailed description of the Scene Delegate:

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    /// In the context of iOS development, the "window" variable typically refers to the UIWindow object, which serves as the root view container for an iOS application. Here's a description of the window variable in an iOS app:
    var window: UIWindow?
    
    /**
     Scene will connect to
     
     * Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
     * If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
     * This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
     
     - Parameter scene: UIScene
     - Parameter session: UIScene session
     - Parameter connectionOptions: UIScene connection options
     */
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    /**
     Scene did disconnect
     * Called as the scene is being released by the system.
     * This occurs shortly after the scene enters the background, or when its session is discarded.
     * Release any resources associated with this scene that can be re-created the next time the scene connects.
     * The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
     
     - Parameter scene: UIScene
     */
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    /**
     Scene did become active
     * Called when the scene has moved from an inactive state to an active state.
     * Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
     
     - Parameter scene: UIScene
     */
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    /**
     Scene will resign active
     * Called when the scene will move from an active state to an inactive state.
     * This may occur due to temporary interruptions (ex. an incoming phone call).
     
     - Parameter scene: UIScene
     */
    func sceneWillResignActive(_ scene: UIScene) {}
    
    /**
     Scene will enter foreground
     * Called as the scene transitions from the background to the foreground.
     * Use this method to undo the changes made on entering the background.
     
     - Parameter scene: UIScene
     */
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    /**
     Scene did enter background
     * Called as the scene transitions from the foreground to the background.
     * Use this method to save data, release shared resources, and store enough scene-specific state information
     * to restore the scene back to its current state.
     
     - Parameter scene: UIScene
     */
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
