//
//  UIViewController + ext.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 14.06.2023.
//

import UIKit

extension UIViewController {
    
        @objc private func back() {
            dismiss(animated: false)
        }
    
        func dissmisWithSwipe() {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(back))
            swipe.direction = .right
            self.view.addGestureRecognizer(swipe)
        }
}
