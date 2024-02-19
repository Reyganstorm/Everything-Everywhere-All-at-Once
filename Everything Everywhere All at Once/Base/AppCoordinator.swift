//
//  AppCoordinator.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var flowComplitionHandler: CoordinatorCompletionHandler?
    
    var navigationController: UINavigationController
    
    private var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isNotAuth = false
        
        if isNotAuth {
            showRegistrationFlow()
        } else {
            showPalygroundFlow()
        }
    }
    
    private func showPalygroundFlow() {
        let playgroundCoordinator = CoordinatorFactory().createPlaygroundCoordinator(navigationController: navigationController)
        childCoordinators.append(playgroundCoordinator)
        
        playgroundCoordinator.flowComplitionHandler = { [weak self] in
            self?.showMainFlow()
            
        }
        
        playgroundCoordinator.start()
    }
    
    private func showRegistrationFlow() {
        let registrationCoordinator = CoordinatorFactory().createRegisterCoordinator(navigationController: navigationController)
        childCoordinators.append(registrationCoordinator)
        
        registrationCoordinator.flowComplitionHandler = { [weak self] in
            self?.showMainFlow()
            
        }
        
        registrationCoordinator.start()
    }
    
    private func showMainFlow() {
        print("HI")
        navigationController.setViewControllers([TestovViewController()], animated: true)
        
        print(navigationController.viewControllers)
    }
    
}
