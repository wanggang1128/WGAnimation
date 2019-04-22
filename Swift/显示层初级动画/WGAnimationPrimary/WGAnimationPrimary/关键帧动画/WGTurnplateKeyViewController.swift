//
//  WGTurnplateKeyViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGTurnplateKeyViewController: UIViewController {

    var imgView: UIImageView?
    var index:CGFloat = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView = UIImageView()
        imgView?.bounds = CGRect(x: 0, y: 0, width: 300, height: 300)
        imgView?.center = self.view.center
        imgView?.image = UIImage(named: "turnPlate")
        imgView?.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(imgView!)
        
        startAnimation()
    }
    
    func startAnimation() {
        
        UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: UIView.KeyframeAnimationOptions(), animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4, animations: {
                
                self.index += 1;
                self.imgView?.transform = CGAffineTransform(rotationAngle: .pi/2*self.index)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4, animations: {
                
                self.index += 1;
                self.imgView?.transform = CGAffineTransform(rotationAngle: .pi/2*self.index)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4, animations: {
                
                self.index += 1;
                self.imgView?.transform = CGAffineTransform(rotationAngle: .pi/2*self.index)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4, animations: {
                
                self.index += 1;
                self.imgView?.transform = CGAffineTransform(rotationAngle: .pi/2*self.index)
            })
            
        }) { (finish) in
            
            if finish {
                self.startAnimation()
            }
        }
    }
}
