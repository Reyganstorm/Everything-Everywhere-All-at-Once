//
//  PlaygroundCoordintor.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.02.2024.
//

import UIKit

class PlaygroundCoordintor: Coordinator {

    var flowComplitionHandler: CoordinatorCompletionHandler?
    
    var navigationController: UINavigationController
    
    private let moduleFactory = ModuleFactory()
    
    private let data = BaseData(one: nil, two: nil, three: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showCheckTest()
    }
    
    
    func showCheckTest() {
        let controller = moduleFactory.createTestVC()
        
        controller.completionHandler = { [weak self] value in
            
            
        }
        
        navigationController.pushViewController(controller, animated: false)
    }

}
