//
//  WGReplicatorViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/9.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGReplicatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        title = "跳动音符"
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = CGRect(x: 0, y: 0, width: WgWith, height: 200)
        replicatorLayer.instanceCount = 20
        replicatorLayer.instanceDelay = 0.2
        replicatorLayer.masksToBounds = true
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        replicatorLayer.backgroundColor = UIColor.black.cgColor

        let layer = CALayer()
        layer.frame = CGRect(x: 14, y: 200, width: 10, height: 100)
        layer.backgroundColor = UIColor.orange.cgColor

        replicatorLayer.addSublayer(layer)
        view.layer.addSublayer(replicatorLayer)

        let ani = CABasicAnimation()
        ani.keyPath = "position.y"
        ani.fromValue = 200
        ani.toValue = 150
        ani.duration = 0.3
        ani.autoreverses = true
        ani.repeatCount = MAXFLOAT
        layer.add(ani, forKey: nil)
        
    }
    

    

}
