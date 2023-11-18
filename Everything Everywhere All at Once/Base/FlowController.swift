//
//  FlowController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit

protocol FlowController {
    
    associatedtype T
    var completionHandler: ((T)->())? {get set}
    
}
