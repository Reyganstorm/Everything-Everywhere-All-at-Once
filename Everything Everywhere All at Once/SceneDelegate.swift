//
//  SceneDelegate.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 12.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator = CoordinatorFactory().createAppCoordinator(navigationController: UINavigationController())
    
//    var appCoordinator: RegisterCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        window?.rootViewController = appCoordinator.navigationController
        appCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

