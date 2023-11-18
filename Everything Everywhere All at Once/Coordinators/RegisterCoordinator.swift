//
//  RegisterCoordinator.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

class RegisterCoordinator: Coordinator {
    
    var flowComplitionHandler: CoordinatorCompletionHandler?
    
    var navigationController: UINavigationController
    
    private let moduleFactory = ModuleFactory()
    
    private let data = BaseData(one: nil, two: nil, three: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showEnterPhoneNumber()
    }
    
    
    func showEnterPhoneNumber() {
        print(#function)
        let controller = moduleFactory.createEnterPhoneNumber()
        
        controller.completionHandler = { [weak self] value in
            self?.data.one = value
            self?.showComformPhoneNumber()
        }
        
        navigationController.pushViewController(controller, animated: false)
    }
    
    func showComformPhoneNumber() {
        print(#function)
        let controller = moduleFactory.createComformPhoneNumber()
        
        controller.completionHandler = { [weak self] value in
            if value {
                self?.shownterPasswordModule()
            } else {
                // show error
            }
        }
        
        navigationController.pushViewController(controller, animated: false)
    }
    
    
    func shownterPasswordModule() {
        print(#function)
        let controller = moduleFactory.createEnterPasswordNumber()
        
        controller.completionHandler = { [weak self] value in
            self?.data.two = value
            self?.showEnterNameModule()
        }
        
        navigationController.pushViewController(controller, animated: false)
    }
    
    func showEnterNameModule() {
        print(#function)
        let controller = moduleFactory.createEnterNameNumber()
        
        controller.completionHandler = { [weak self] value in
            self?.data.three = value
            self?.showEnterBirdtaheModule()
        }
        print("HI")
        print(navigationController.viewControllers)
        navigationController.pushViewController(controller, animated: false)
    }
    
    func showEnterBirdtaheModule() {
        print(#function)
        let controller = moduleFactory.createEnterBirtdayNumber()
        
        controller.completionHandler = { [weak self] value in
            self?.data.three = value
            
            self?.flowComplitionHandler?()
            
        }
        
        navigationController.pushViewController(controller, animated: false)
    }
}
