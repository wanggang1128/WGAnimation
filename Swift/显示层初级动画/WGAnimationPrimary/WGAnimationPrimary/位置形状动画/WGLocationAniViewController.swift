//
//  WGLocationAniViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/18.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGLocationAniViewController: UIViewController {

    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loginBtn = UIButton(frame: CGRect(x: 20, y: 200, width: WgWith-20*2, height: 30))
        loginBtn.backgroundColor = UIColor.cyan
        loginBtn.setTitle("登录", for: .normal)
        view.addSubview(loginBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //动画开始
        UIView.beginAnimations(nil, context: nil)
        //动画持续时间
        UIView.setAnimationDuration(2)
        //最后状态
        loginBtn.frame = CGRect(x: 0, y: loginBtn.bottom+50, width: loginBtn.width*0.7, height: loginBtn.height*1.2)
        //提交动画
        UIView.commitAnimations()
    }

}
