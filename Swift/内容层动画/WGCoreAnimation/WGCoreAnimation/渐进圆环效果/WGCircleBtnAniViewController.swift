//
//  WGCircleBtnAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/24.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGCircleBtnAniViewController: UIViewController {

    var btn01: WGButtnAniView!
    var btn02: WGButtnAniView!
    var btn03: WGButtnAniView!
    
    var tap01: UITapGestureRecognizer!
    var tap02: UITapGestureRecognizer!
    var tap03: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "渐进圆环动画"
        
        let btnW:CGFloat = 150
        let btnH:CGFloat = 75
        
        btn01 = WGButtnAniView(frame: CGRect(x: (WgWith-btnW)/2, y: 100, width: btnW, height: btnH))
        view.addSubview(btn01)
        tap01 = UITapGestureRecognizer(target: self, action: #selector(tapMetnod01))
        btn01.addGestureRecognizer(tap01)
        
        
        btn02 = WGButtnAniView(frame: CGRect(x: (WgWith-btnW)/2, y: 200, width: btnW, height: btnH))
        view.addSubview(btn02)
        //修改颜色
        btn02.firstColor = UIColor.purple
        btn02.midColor = UIColor.black
        btn02.lastColor = UIColor.blue
        tap02 = UITapGestureRecognizer(target: self, action: #selector(tapMetnod02))
        btn02.addGestureRecognizer(tap02)
        
        
        btn03 = WGButtnAniView(frame: CGRect(x: (WgWith-btnW)/2, y: 300, width: btnW, height: btnH))
        view.addSubview(btn03)
        tap03 = UITapGestureRecognizer(target: self, action: #selector(tapMetnod03))
        btn03.addGestureRecognizer(tap03)
    }

    @objc func tapMetnod01() {
        
        btn01.startAnimation(duation: 1)
    }
    
    @objc func tapMetnod02() {
        
        btn02.startAnimation(duation: 3)
        //圆环动画时间
        btn02.midDuation = 5
        //恢复时间
        btn02.lastDuation = 1
    }
    
    @objc func tapMetnod03() {
        
        //修改颜色
        btn03.firstColor = UIColor.blue
        btn03.midColor = UIColor.brown
        btn03.lastColor = UIColor.purple
        //圆环动画时间
        btn03.midDuation = 1
        //恢复时间
        btn03.lastDuation = 5
        btn03.startAnimation(duation: 5)
    }
}
