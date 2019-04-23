//
//  WGCombinationViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/18.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGCombinationViewController: UIViewController {

    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loginBtn = UIButton(frame: CGRect(x: -200, y: 200, width: WgWith-20*2, height: 30))
        loginBtn.backgroundColor = UIColor.cyan
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.black, for: .normal)
        loginBtn.alpha = 0;
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        view.addSubview(loginBtn)
    }
    
    @objc func loginBtnClicked(){
        
        UIView.animate(withDuration: 2) {
            
            //旋转
            self.loginBtn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            //位置,形状
            self.loginBtn.frame = CGRect(x: WgWith, y: 64, width: 0, height: 0)
            //颜色改变
            self.loginBtn.backgroundColor = UIColor.yellow
            //透明度
            self.loginBtn.alpha = 0;
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 2) {
            
            self.loginBtn.frame = CGRect(x: 20, y: self.loginBtn.top, width: self.loginBtn.width, height: self.loginBtn.height)
            self.loginBtn.backgroundColor = UIColor.red
            self.loginBtn.alpha = 1;
        }
    }
}


