//
//  CoordinatorFactory.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        AppCoordinator(navigationController: navigationController)
    }
    
    func createRegisterCoordinator(navigationController: UINavigationController) -> RegisterCoordinator {
        RegisterCoordinator(navigationController: navigationController)
    }
    
    func createPlaygroundCoordinator(navigationController: UINavigationController) -> PlaygroundCoordintor {
        PlaygroundCoordintor(navigationController: navigationController)
    }
}
