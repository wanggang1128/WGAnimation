//
//  WGBeatAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/6.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGBeatAniViewController: UIViewController {

    var audioBarNum:Int = 0
    var gradientLayer:CAGradientLayer = CAGradientLayer()
    var layerArray:NSMutableArray = NSMutableArray()
    var colorArray:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        title = "跳动动画"
        
        audioBarNum = 15

        buildColorArr()
        buildLayerArr()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changeColor), userInfo: nil, repeats: true)
    }
    
    @objc func changeColor() {
        
        for layer in layerArray {
            
            let index = Int(arc4random_uniform(11))
            let color = colorArray[index] as! UIColor
            let colorArr = [UIColor.clear.cgColor, color.cgColor]
            
            let layer = layer as! CAGradientLayer
            layer.colors = colorArr
            layer.locations = [0.0, 1.0]
            
            let ani = CABasicAnimation()
            ani.keyPath = "locations"
            let beginValue = Float(arc4random_uniform(11))/10.0
            ani.fromValue = [beginValue, beginValue]
            ani.toValue = [1.0, 1.0]
            ani.duration = 0.4
            layer.add(ani, forKey: nil)
        }
    }
    
    func buildLayerArr() {
        
        for index in 0...audioBarNum {
            
            let h:CGFloat = 150
            let w:CGFloat = (self.view.frame.size.width-10)/CGFloat(audioBarNum)
            let x:CGFloat = 20
            let y:CGFloat = 150
            let view:UIView = UIView(frame: CGRect(x: w*CGFloat(index)+x, y: y, width: w-x, height: h))
            self.view.addSubview(view)
            
            gradientLayer = CAGradientLayer()
            gradientLayer.frame = view.bounds;
            gradientLayer.startPoint = CGPoint(x: 0, y: 0);
            gradientLayer.endPoint = CGPoint(x: 0, y: 1);
            view.layer.addSublayer(gradientLayer)
            layerArray.add(gradientLayer)
        }
    }
    
    func buildColorArr() {
        
        let  color1:UIColor = UIColor(red: 255.0 / 255.0, green: 127.0 / 255.0, blue: 79.0 / 255.0, alpha: 1.0)
        let  color2:UIColor = UIColor(red: 138.0 / 255.0, green: 206.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        let  color3:UIColor = UIColor(red: 216.0 / 255.0, green: 114.0 / 255.0, blue: 213.0 / 255.0, alpha: 1.0)
        let  color4:UIColor = UIColor(red: 51.0 / 255.0, green: 207.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
        let  color5:UIColor = UIColor(red: 102.0 / 255.0, green: 150.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
        let  color6:UIColor = UIColor(red: 255.0 / 255.0, green: 105.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        let  color7:UIColor = UIColor(red: 187.0 / 255.0, green: 56.0 / 255.0, blue: 201.0 / 255.0, alpha: 1.0)
        let  color8:UIColor = UIColor(red: 255.0 / 255.0, green: 163.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)
        let  color9:UIColor = UIColor(red: 203.0 / 255.0, green: 93.0 / 255.0, blue: 92.0 / 255.0, alpha: 1.0)
        let  color10:UIColor = UIColor(red: 61.0 / 255.0, green: 226.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0)
        let  color11:UIColor = UIColor(red: 25.0 / 255.0, green: 146.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        colorArray.add(color1)
        colorArray.add(color2)
        colorArray.add(color3)
        colorArray.add(color4)
        colorArray.add(color5)
        colorArray.add(color6)
        colorArray.add(color7)
        colorArray.add(color8)
        colorArray.add(color9)
        colorArray.add(color10)
        colorArray.add(color11)
    }
}
