//
//  SceneDelegate.swift
//  LiveTextDemo
//
//  Created by Charlie Chapman on 6/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = MainViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }
}

