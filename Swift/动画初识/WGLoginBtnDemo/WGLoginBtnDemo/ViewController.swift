//
//  ViewController.swift
//  WGLoginBtnDemo
//
//  Created by wanggang on 2019/4/12.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loginBtn: UIButton!
    
    /*
     设置视图的动画初始状态
     添加视图的动画相应属性
     设置动画最终状态
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "登录"
        view.backgroundColor = UIColor.white
        
        //动画的起始阶段:loginBtn初始位置设置在屏幕外
        loginBtn = UIButton.init(frame: CGRect.init(x: -view.frame.width, y: 200, width: view.frame.width-20*2, height: 50))
        loginBtn.backgroundColor = UIColor.yellow
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(loginBtn)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //动画的进行阶段:恢复loginBtn正确位置
        //viewDidAppear中设置的话,视图已经显示,会有不连贯
        UIView.animate(withDuration: 1) {

            self.loginBtn.frame = CGRect.init(x: 20, y: self.loginBtn.frame.origin.y, width: self.loginBtn.frame.size.width, height: self.loginBtn.frame.size.height)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: 1, animations: {

            self.loginBtn.frame = CGRect.init(x: -self.view.frame.width, y: self.loginBtn.frame.origin.y, width: self.loginBtn.frame.size.width, height: self.loginBtn.frame.size.height)

        }) { (isTrue) in

            UIView.animate(withDuration: 2) {

                self.loginBtn.frame = CGRect.init(x: 20, y: self.loginBtn.frame.origin.y, width: self.loginBtn.frame.size.width, height: self.loginBtn.frame.size.height)
            }
        }
    }
}

