//
//  WGCoverFlowViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/9.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGCoverFlowViewController: UIViewController {

    var imageViewArr: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "CoverFlow效果"
        
        let imageView1 = UIImageView(frame:CGRect(x: 100, y: 200, width: 200, height: 250))
        imageView1.image = UIImage(named: "0.jpg")
        imageView1.layer.anchorPoint.y = 0.0
        view.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame:CGRect(x: 100, y: 200, width: 200, height: 250))
        imageView2.image = UIImage(named: "1.jpg")
        imageView2.layer.anchorPoint.y = 0.0
        view.addSubview(imageView2)

        let imageView3 = UIImageView(frame:CGRect(x: 100, y: 250, width: 300, height: 200))
        imageView3.image = UIImage(named: "2.jpg")
        imageView3.layer.anchorPoint.y = 0.0
        view.addSubview(imageView3)

        imageViewArr = [imageView1, imageView2, imageView3]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        for i in 0...imageViewArr.count-1 {

            var imageTransform = CATransform3DIdentity
            imageTransform.m34 = -0.005
            imageTransform = CATransform3DTranslate(imageTransform, 0, 50, 0)
            imageTransform = CATransform3DScale(imageTransform, 0.95, 0.6, 1.0)
            if i == 0{
                imageTransform = CATransform3DRotate(imageTransform, CGFloat(Double.pi/8), 0, 1, 0)
            }else if i == 1{
                imageTransform = CATransform3DRotate(imageTransform, CGFloat(-Double.pi/8), 0, 1, 0)
            }

            let imgView = imageViewArr[i] as! UIImageView

            let transformAni = CABasicAnimation(keyPath: "transform")
            transformAni.fromValue = NSValue(caTransform3D: imgView.layer.transform)
            transformAni.toValue = NSValue(caTransform3D: imageTransform)
            transformAni.duration = 6

            let transformPosition = CABasicAnimation(keyPath: "position")
            transformPosition.duration = 6
            if i==0 {
                transformPosition.toValue = NSValue(cgPoint:CGPoint(x: 100, y: 30))
            }else if i==1{
                transformPosition.toValue = NSValue(cgPoint:CGPoint(x: 300, y: 30))
            }else{
                transformPosition.toValue = NSValue(cgPoint:CGPoint(x: 200, y: 40))
            }

            let aniGroup = CAAnimationGroup()
            aniGroup.animations = [transformAni, transformPosition]
            aniGroup.duration = 6
            aniGroup.isRemovedOnCompletion = false
            aniGroup.repeatCount = 1
            aniGroup.fillMode = .forwards
            aniGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

            imgView.layer.add(aniGroup, forKey: nil)

        }
    }

}
