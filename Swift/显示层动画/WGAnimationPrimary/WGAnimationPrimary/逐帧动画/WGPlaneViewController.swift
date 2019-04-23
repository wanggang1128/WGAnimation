//
//  WGPlaneViewController.swift
//  WGAnimationPrimary
//
//  Created by wanggang on 2019/4/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class WGPlaneViewController: UIViewController {

    var imgView: UIImageView!
    var index = 0
    var displayLink: CADisplayLink?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        imgView = UIImageView(frame: UIScreen.main.bounds)
        imgView.contentMode = .scaleAspectFit
        self.view.addSubview(imgView)
        
//        changeImageView01()
        changeImageView02()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        displayLink?.remove(from: .current, forMode: .default)
    }
    
    //第一种实现方式
    func changeImageView01() {
        
        displayLink = CADisplayLink(target: self, selector: #selector(refreashImg))
        //设置一秒内有几帧刷新，默认60，即是一秒内有60帧执行刷新调用。
        displayLink?.preferredFramesPerSecond = 30;
        displayLink?.add(to: .current, forMode: .default)
    }
    
    //第二种实现方式
    func changeImageView02() {
        
        var imgArr: [UIImage] = [];
        for i in 0...66 {
            let imgName = "\(i).png"
            let img = UIImage(named: imgName)
            imgArr.append(img!)
        }
        
        imgView.animationImages = imgArr
        imgView.animationDuration = 5
        imgView.animationRepeatCount = 3
        imgView.startAnimating()
    }
    
    @objc func refreashImg() {
        
        imgView.image = UIImage(named: "\(index).png")
        index += 1
        if index == 67 {
            index = 0
            imgView.image = UIImage(named: "\(index).png")
        }
    }
    
}
