//
//  WGWaterWaveBtn.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/23.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGWaterWaveBtn: UIButton {

    //水纹半径
    var viewRadius:CGFloat = 0.0
    //定时器
    var timer: Timer?
    //点击处
    var pointX:CGFloat = 0.0
    var pointY:CGFloat = 0.0
    //水纹颜色
    var aniColor = UIColor.cyan
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.brown
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation(event: UIEvent) {
        
        self.isUserInteractionEnabled = false
        let buttonView = self as UIView
        let touchSet = event.touches(for: buttonView)! as NSSet
        let touchArr = touchSet.allObjects
        let touch = touchArr.first as! UITouch
        let touchPoint = touch.location(in: buttonView)
        
        pointX = touchPoint.x
        pointY = touchPoint.y
        
        timer = Timer(timeInterval: 0.02, target: self, selector: #selector(timerMethod), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    @objc func timerMethod() {
        
        self.viewRadius += 5
        self.setNeedsDisplay()
        
        if viewRadius >= self.width {
            timer?.invalidate()
            viewRadius = 0
            self.setNeedsDisplay()
            self.isUserInteractionEnabled = true
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.addArc(center: CGPoint(x: pointX, y: pointY), radius: viewRadius, startAngle: 0, endAngle: .pi*2, clockwise: false)
        aniColor.setStroke()
        aniColor.setFill()
        ctx?.fillPath()
    }

}
