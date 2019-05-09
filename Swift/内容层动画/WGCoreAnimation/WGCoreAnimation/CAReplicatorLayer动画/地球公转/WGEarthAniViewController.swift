//
//  WGEarthAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/8.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGEarthAniViewController: UIViewController {

    var earthImgView: UIImageView!
    var replicatorLayer:CAReplicatorLayer = CAReplicatorLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "🌎公转"
        view.backgroundColor = UIColor.cyan
        
        earthImgView = UIImageView(frame: CGRect(x: (WgWith-50)/2+150, y: (WgHeight-50)/2, width: 50, height: 50))
        earthImgView.image = UIImage(named: "earth")
        
        let sunImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        sunImgView.center = view.center
        sunImgView.image = UIImage(named: "sun")
        
        replicatorLayer.addSublayer(earthImgView.layer)
        replicatorLayer.addSublayer(sunImgView.layer)

        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: view.center, radius: 150, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        bezierPath.close()
        
        let ani = CAKeyframeAnimation()
        ani.keyPath = "position"
        ani.path = bezierPath.cgPath
        ani.duration = 10
        ani.repeatCount = MAXFLOAT
        
        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceDelay = 1
        
        view.layer.addSublayer(replicatorLayer)
        earthImgView.layer.add(ani, forKey: nil)
        
    }
    

}
