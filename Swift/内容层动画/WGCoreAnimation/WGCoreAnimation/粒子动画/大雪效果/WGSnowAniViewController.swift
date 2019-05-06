//
//  WGSnowAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/6.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGSnowAniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        title = "大雪动画"
        
        //粒子发射器图层
        let emitterLayer = CAEmitterLayer()
        //粒子发射器位置
        emitterLayer.emitterPosition = CGPoint(x: 0, y: -30)
        //粒子发射器的范围
        emitterLayer.emitterSize = CGSize(width: WgWith*2, height: 0)
        //发射模式
        emitterLayer.emitterMode = .outline
        //粒子模式
        emitterLayer.emitterShape = .line
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "snow")?.cgImage
        //设置粒子缩放比例
        emitterCell.scale = 0.02;
        //缩放范围
        emitterCell.scaleRange = 0.5;
        //每秒粒子产生数量
        emitterCell.birthRate = 100;
        //粒子生命周期
        emitterCell.lifetime = 80;
        //粒子透明速度
        emitterCell.alphaSpeed = -0.01;
        //粒子速度
        emitterCell.velocity=80;
        emitterCell.velocityRange=50;
        //设置角度
        emitterCell.emissionRange = CGFloat(Double.pi);
        //设置粒子旋转角速度
        emitterCell.spin = CGFloat(Double.pi/4);
        
        emitterLayer.emitterCells = [emitterCell]
        
        view.layer.addSublayer(emitterLayer)
        
    }

}
