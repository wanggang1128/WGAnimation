//
//  WGLineChartView.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/7.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGLineChartView: UIView {

    let lineChart = CAShapeLayer()
    let ani = CABasicAnimation()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        lineChart.lineCap = .round
        lineChart.lineJoin = .round
        lineChart.fillColor = UIColor.white.cgColor
        lineChart.lineWidth = 10
        lineChart.strokeEnd = 0.0
        self.layer.addSublayer(lineChart)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let bezierPath = UIBezierPath()
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        bezierPath.lineWidth = 10.0
        bezierPath.move(to: CGPoint(x: 30+35, y: 260))
        bezierPath.addLine(to: CGPoint(x: 100+35, y: 100))
        bezierPath.addLine(to: CGPoint(x: 170+35, y: 240))
        bezierPath.addLine(to: CGPoint(x: 240+35, y: 170))
        bezierPath.addLine(to: CGPoint(x: 310+35, y: 220))
        
        lineChart.path = bezierPath.cgPath
        lineChart.strokeColor = UIColor.red.cgColor
        
        ani.keyPath = "strokeEnd"
        ani.timingFunction = CAMediaTimingFunction(name: .easeIn)
        ani.fromValue = 0.0
        ani.toValue = 1.0
        ani.autoreverses = false
        ani.duration = 2.0
    }

    func chartAniStart() {
        
        lineChart.strokeEnd = 1.0
        lineChart.add(ani, forKey: nil)
    }
    
}
