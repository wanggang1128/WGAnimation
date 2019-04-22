//
//  WGZoomViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGZoomViewController: UIViewController {

    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        loginBtn = UIButton(frame: CGRect(x: 20, y: 200, width: WgWith-20*2, height: 30))
        loginBtn.backgroundColor = UIColor.cyan
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(loginBtn)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDuration(2)
//        平移
//        self.loginBtn.transform = CGAffineTransform(translationX: 0, y: 400)
        //旋转
        self.loginBtn.transform = CGAffineTransform(rotationAngle: .pi)
//        //缩放
//        self.loginBtn.transform = CGAffineTransform(scaleX: 0.8, y: 1.5)
        
        //设置开始回调方法
        UIView.setAnimationWillStart(#selector(animationStart))
        //设置结束回调方法
        UIView.setAnimationDidStop(#selector(animationStop))
        UIView.commitAnimations()
        
    }
    
    @objc func animationStart() {
        
        print("animationStart")
    }
    
    @objc func animationStop() {
        
        UIView.animate(withDuration: 2) {
            
        }
        print("animationStop")
    }
}
