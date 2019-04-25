//
//  WGFireAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/25.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGFireAniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        title = "火动画"
        
        //粒子发射器
        let emitterLay = CAEmitterLayer()
        //粒子发射位置
        emitterLay.position = self.view.center
        // 控制火苗大小
        emitterLay.emitterSize = CGSize(width: 100, height: 50)
        emitterLay.renderMode = .additive
        // 控制发射源模式 即形状
        emitterLay.emitterMode = .outline
        emitterLay.emitterShape = .line
        self.view.layer.addSublayer(emitterLay)
        
        let emitterCell = CAEmitterCell()
        emitterCell.name = "fire"
        //发射方向
        emitterCell.emissionLongitude = CGFloat(Double.pi)
        // 粒子速度 负数表明向上燃烧
        emitterCell.velocity = -100
        // 粒子速度范围
        emitterCell.velocityRange = 20
        //周围发射角度
        emitterCell.emissionRange = 2
        //粒子y方向的加速度分量
        emitterCell.yAcceleration = -200
        //缩放比例 超大火苗
        emitterCell.scaleSpeed = 0.5
        //火苗颜色
        emitterCell.color = UIColor(red: 0.8 ,green: 0.4 ,blue:0.2 ,alpha:0.1).cgColor
        emitterCell.contents = UIImage(named: "fire.png")!.cgImage
        
        emitterLay.emitterCells = [emitterCell];
        emitterLay.setValue(1000, forKeyPath: "emitterCells.fire.birthRate")
        emitterLay.setValue(1, forKeyPath: "emitterCells.fire.lifetime")
        
    }

}
