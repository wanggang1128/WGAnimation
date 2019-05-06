//
//  WGNeonAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/25.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGNeonAniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "霓虹效果"
        view.backgroundColor = UIColor.black
        
        let emitterCell = CAEmitterCell()
        emitterCell.name = "nenolight"
        //发射方向
        emitterCell.emissionLongitude  = CGFloat(Double.pi*2)
        // 粒子速度
        emitterCell.velocity = 50
        // 粒子速度范围
        emitterCell.velocityRange = 50
        // 缩放比例
        emitterCell.scaleSpeed = -0.2
        emitterCell.scale = 0.1
        emitterCell.greenSpeed = -0.1
        emitterCell.redSpeed = -0.2
        emitterCell.blueSpeed = 0.1
        emitterCell.alphaSpeed = -0.2
        emitterCell.birthRate = 100
        emitterCell.lifetime = 4
        emitterCell.color = UIColor.white.cgColor
        emitterCell.contents = UIImage(named:"nenolight.png")?.cgImage
        
        
        let emitterLayer = CAEmitterLayer()
        // 粒子发射位置
        emitterLayer.position = self.view.center
        // 控制粒子大小
        emitterLayer.emitterSize = CGSize(width: 2, height: 2)
        emitterLayer.renderMode = .backToFront
        // 控制发射源模式 即形状
        emitterLayer.emitterMode = .outline
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterCells = [emitterCell]
        
        self.view.layer.addSublayer(emitterLayer)
        
    }


}
