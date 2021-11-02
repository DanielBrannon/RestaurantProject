//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let coordinator = Coordinator()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator.navCon
        window?.makeKeyAndVisible()
        coordinator.pushSearchVC()
    }
}
