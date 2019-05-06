//
//  WGScanAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/6.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGScanAniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        title = "扫描动画"
        
        //设置梯度图层
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: (WgWith-200)/2, y: 200, width: 200, height: 200)
        view.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.colors = [UIColor.white.cgColor,UIColor.red.cgColor,UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 0.05, 0.1]
        //设置动画
        let ani = CABasicAnimation()
        ani.keyPath = "locations"
        ani.fromValue = [0.0,0.05,0.1]
        ani.toValue = [0.9,0.95,1.0]
        ani.duration = 3
        ani.repeatCount = 100
        gradientLayer.add(ani, forKey: nil)
    }

}
