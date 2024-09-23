//
//  SceneDelegate.swift
//  9.17.24-note-app-1
//
//  Created by Ryan on 9/17/24.
//

import Foundation

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let noteListVC = NoteListViewController()
        let navigationController = UINavigationController(rootViewController: noteListVC)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    // ... (keep other methods)
}
