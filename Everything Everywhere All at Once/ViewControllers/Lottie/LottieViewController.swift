//
//  LottieViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 14.06.2023.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    
    var switcherValue = false
    
    private let dayNigthSwitch: LottieAnimationView = {
        let switcher = LottieAnimationView(name: "dayNightSwitch")
        return switcher
    }()
    
    private let switcherButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dissmisWithSwipe()
        dayNigthSwitch.center = view.center
        switcherButton.frame = dayNigthSwitch.frame
        view.addSubview(dayNigthSwitch)
        view.addSubview(switcherButton)
        switcherButton.addTarget(self, action: #selector(switcherTogle), for: .touchUpInside)
    }
    
    @objc private func switcherTogle() {
        switch switcherValue {
        case true:
            dayNigthSwitch.play(fromProgress: 0.48, toProgress: 1)
        case false:
            dayNigthSwitch.play(fromProgress: 0, toProgress: 0.48)
        }
        switcherValue.toggle()
    }
}
