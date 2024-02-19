//
//  EnterPhoneViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.11.2023.
//

import UIKit
import ColorPanel

class EnterPhoneViewController: UIViewController, FlowController {
    
    var completionHandler: ((String) -> ())?
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("EnterPhoneViewController", for: .normal)
        button.backgroundColor = ColorPanel().mainColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPanel().backroundColor
        view.addSubview(button)
        button.frame = CGRect(x: view.frame.width/3,
                              y: view.frame.height/2,
                              width: 200,
                              height: 50)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton() {
        print(#function)
        completionHandler?("First tap")
    }


}
