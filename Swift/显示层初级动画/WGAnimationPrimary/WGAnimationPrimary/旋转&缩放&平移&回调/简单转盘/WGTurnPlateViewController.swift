//
//  WGTurnPlateViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGTurnPlateViewController: UIViewController {

    var imgView: UIImageView?
    var index = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView = UIImageView()
        imgView?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        imgView?.center = self.view.center
        imgView?.image = UIImage(named: "turnPlate")
        imgView?.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(imgView!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDuration(0.3)
        self.imgView?.transform = CGAffineTransform(rotationAngle: .pi/2)
        UIView.setAnimationDidStop(#selector(animationStop))
        UIView.commitAnimations()
    }
    
    @objc func animationStop(){
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDuration(0.3)
        index += 1;
        let angle = (CGFloat)(Double.pi/2*index)
        self.imgView?.transform = CGAffineTransform(rotationAngle: angle)
        UIView.setAnimationDidStop(#selector(animationStop))
        UIView.commitAnimations()
    }
}
