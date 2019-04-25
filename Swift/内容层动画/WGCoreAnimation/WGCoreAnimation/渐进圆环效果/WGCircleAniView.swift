//
//  WGCircleAniView.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/24.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

protocol WGCircleAniViewDelegate {
    func circleAniStop()
}

class WGCircleAniView: UIView {

    var lineWidth: CGFloat = 4
    var strokeColor = UIColor.black
    var circle = CAShapeLayer()
    var wgCircleAniViewDelegate: WGCircleAniViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let startAngle = CGFloat(Double.pi)*(90.01/180.0)
        let endAngle = CGFloat(Double.pi)*(90.0/180.0)
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2-2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle.path = circlePath.cgPath
        circle.lineCap = .round
        circle.fillColor = UIColor.clear.cgColor
        circle.lineWidth = lineWidth
        self.layer.addSublayer(circle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startCircleAnimation(duation: CFTimeInterval) {
        
        circle.strokeColor = strokeColor.cgColor
        let progressAni = CABasicAnimation()
        progressAni.keyPath = "strokeEnd"
        progressAni.delegate = self
        progressAni.fromValue = 0
        progressAni.toValue = 1
        progressAni.duration = duation
        progressAni.fillMode = .forwards
        progressAni.isRemovedOnCompletion = false
        progressAni.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        progressAni.setValue("strokeEndAnimationcircle", forKey: "groupborderkeycircle")
        circle.add(progressAni, forKey: "strokeEndAnimationcircle")
    }
}

extension WGCircleAniView: CAAnimationDelegate{
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        wgCircleAniViewDelegate?.circleAniStop()
    }
}
