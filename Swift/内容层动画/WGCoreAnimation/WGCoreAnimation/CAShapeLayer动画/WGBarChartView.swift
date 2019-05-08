//
//  WGBarChartView.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/8.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGBarChartView: UIView {

    let barChart = CAShapeLayer()
    let ani = CABasicAnimation()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        barChart.lineCap = .square
        barChart.lineJoin = .round
        barChart.strokeEnd = 0.0
        barChart.lineWidth = 30
        barChart.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(barChart)
    }
    
    override func draw(_ rect: CGRect) {
        
        let bezierPath = UIBezierPath()
        bezierPath.lineWidth = 30
        bezierPath.lineCapStyle = .square
        bezierPath.lineJoinStyle = .round
        
        for i in 0...4 {
            
            let x = CGFloat(60+70*i)
            let y = CGFloat(100+20*i)
            
            bezierPath.move(to: CGPoint(x: x, y: 215))
            bezierPath.addLine(to: CGPoint(x: x, y: y))
        }
        barChart.path = bezierPath.cgPath
        barChart.strokeColor = UIColor.green.cgColor
        
        ani.keyPath = "strokeEnd"
        ani.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        ani.fromValue = 0.0
        ani.toValue = 1.0
        ani.autoreverses = false
        ani.duration = 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func barAniStart() {
        
        barChart.strokeEnd = 1.0
        barChart.add(ani, forKey: nil)
    }
    
}
