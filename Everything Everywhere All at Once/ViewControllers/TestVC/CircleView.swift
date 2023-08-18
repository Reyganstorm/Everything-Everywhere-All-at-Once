//
//  CircleView.swift
//  Everything Everywhere All at Once
//
//  Created by Руслан Штыбаев on 27.07.2023.
//

import UIKit


class CircleView: UIView {
    
    private let progressLayer = CAShapeLayer()
    
    private var progressColor:UIColor!
    
    required convenience init(progressColor:UIColor) {
        self.init(frame:.zero)
        self.progressColor = progressColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        setup()
    }
    
    
    private func setup() {
        let circleLayer = CAShapeLayer()
        
        let center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        let path = UIBezierPath(arcCenter: center, radius: self.frame.width / 2, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        circleLayer.path = path.cgPath
        circleLayer.strokeColor = UIColor.gray.cgColor
        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.lineCap = CAShapeLayerLineCap.round
        circleLayer.lineWidth = 20
        circleLayer.masksToBounds = false
        self.layer.addSublayer(circleLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.lineWidth = 20
        
        circleLayer.addSublayer(progressLayer)
    }
    
    func animateProgress(percentComplete:Double) {
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        progressAnimation.fromValue = 0
        progressAnimation.toValue = 0.5
        progressAnimation.duration = 2
        progressAnimation.fillMode = .forwards
        progressAnimation.isRemovedOnCompletion = false
        
        progressLayer.add(progressAnimation, forKey: "strokeEnd")
    }
}
