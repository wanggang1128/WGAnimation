//
//  WGAlphaAniViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/18.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGAlphaAniViewController: UIViewController {

   
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        loginBtn = UIButton(frame: CGRect(x: 20, y: 200, width: WgWith-20*2, height: 30))
        loginBtn.backgroundColor = UIColor.cyan
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.black, for: .normal)
        loginBtn.alpha = 0;
        view.addSubview(loginBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 2) {
            
            self.loginBtn.backgroundColor = UIColor.red
            self.loginBtn.alpha = 1;
        }
    }

}
