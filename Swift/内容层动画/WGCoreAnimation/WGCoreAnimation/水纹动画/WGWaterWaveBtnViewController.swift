//
//  WGWaterWaveBtnViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/23.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGWaterWaveBtnViewController: UIViewController {

    var btn: WGWaterWaveBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        btn = WGWaterWaveBtn(frame: CGRect(x: 20, y: 100, width: WgWith-20*2, height: 50))
        btn.setTitle("点我", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btnClicked(sender:event:)), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnClicked(sender: WGWaterWaveBtn, event: UIEvent) {
        
        sender.startAnimation(event: event)
    }

}
