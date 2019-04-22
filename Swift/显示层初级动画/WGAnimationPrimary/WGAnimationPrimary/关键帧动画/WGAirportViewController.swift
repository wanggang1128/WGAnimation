//
//  WGAirportViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGAirportViewController: UIViewController {

    var airportImgView: UIImageView!
    var planeImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        airportImgView = UIImageView(frame: UIScreen.main.bounds)
        airportImgView.image = UIImage(named: "airport")
        airportImgView.contentMode = .scaleAspectFit
        view.addSubview(airportImgView)
        
        planeImgView = UIImageView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        planeImgView.image = UIImage(named: "plane")
        planeImgView.contentMode = .scaleAspectFit
        airportImgView.addSubview(planeImgView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {
                
                self.planeImgView.frame = CGRect(x: 300, y: 100, width: 30, height: 30)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {
                
                self.planeImgView.frame = CGRect(x: 300, y: 300, width: 80, height: 80)
            })
            
        }) { (finish) in
            
            print("动画完成")
        }
    }
  

}
