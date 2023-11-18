//
//  AppDelegate.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 12.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator = CoordinatorFactory().createAppCoordinator(navigationController: UINavigationController())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = appCoordinator.navigationController
        appCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }
}

