//
//  ModuleFactory.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

class ModuleFactory {
    
    
    func createEnterPhoneNumber() -> EnterPhoneViewController {
        EnterPhoneViewController()
    }
    
    func createComformPhoneNumber() -> ComformPhoneViewController {
        ComformPhoneViewController()
    }
    
    func createEnterPasswordNumber() -> EnterPasswordViewController {
        EnterPasswordViewController()
    }
    
    func createEnterNameNumber() -> EnterNameViewController {
        EnterNameViewController()
    }
    
    func createEnterBirtdayNumber() -> EnterBirtdayViewController {
        EnterBirtdayViewController()
    }
}
