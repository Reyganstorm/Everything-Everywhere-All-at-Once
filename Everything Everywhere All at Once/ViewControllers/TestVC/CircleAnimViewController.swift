//
//  CircleAnimViewController.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 27.07.2023.
//

import UIKit

class CircleViewController: UIViewController {
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let dotLayer: CALayer = CALayer()
    let seconds = 2.0
    
    
    
    // MARK: - Properties
    private var progressBarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Making Progress"
        view.backgroundColor = .systemTeal
        
        // determine the value of Center
        let center = view.center
        
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: 100,
            startAngle: CGFloat.pi / 2,
            endAngle: CGFloat.pi * 3 / 2,
            clockwise: true
        ) // these values give us a complete circle
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap )))
    }
    
    @objc private func handleTap() {
        print("Attempting to animate stroke")
        
        // circle image
        let circleNobImage = UIImage(named: "pegasus")!
        
        dotLayer.contents = circleNobImage.cgImage
        dotLayer.bounds = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        
        view.layer.addSublayer(dotLayer)
        
        dotLayer.position = CGPoint(x: 105, y: 460)
        
        dotLayer.opacity = 1
        
        dotAnimation()
    }
    
    func dotAnimation() {
        let dotAnimation = CAKeyframeAnimation(keyPath: "position")
        dotAnimation.path = trackLayer.path
        dotAnimation.calculationMode = .paced
        dotAnimation.isRemovedOnCompletion = false
        
        let dotAnimationGroup = CAAnimationGroup()
        dotAnimationGroup.fillMode = .forwards
        dotAnimationGroup.isRemovedOnCompletion = false
        dotAnimationGroup.duration = seconds
        dotAnimation.autoreverses = true
        dotAnimationGroup.animations = [dotAnimation]
        dotLayer.add(dotAnimationGroup, forKey: nil)
    }
}

