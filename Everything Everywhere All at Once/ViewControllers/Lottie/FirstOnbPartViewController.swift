//
//  FirstOnbPartViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 19.06.2023.
//

import UIKit
import Lottie

class FirstOnbPartViewController: UIViewController {

    private let onboarding: LottieAnimationView = {
//        let animation = LottieAnimationView(name: "onboardingFirstPart")
        let animation = LottieAnimationView(name: "onbFirst")
//        animation.
        animation.maskAnimationToBounds = true
        return animation
    }()

    private let switcherButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        onboarding.
        view.backgroundColor = .systemBlue
        onboarding.frame = view.frame
        switcherButton.frame = onboarding.frame
        view.addSubview(onboarding)
        dissmisWithSwipe()
        view.addSubview(switcherButton)
        switcherButton.addTarget(self, action: #selector(switcherTogle), for: .touchUpInside)
    }
    
    
    @objc private func switcherTogle() {
        
        onboarding.play { _ in
            self.dismiss(animated: true)
        }
        
    }

}
