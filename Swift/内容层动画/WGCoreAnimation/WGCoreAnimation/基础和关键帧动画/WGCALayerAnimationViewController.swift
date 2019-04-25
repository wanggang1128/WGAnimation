//
//  WGCALayerAnimationViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/23.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGCALayerAnimationViewController: UIViewController {

    var showBtn: UIButton!
    var tableView: UITableView!
    let dataArr = ["位置动画-position","位置动画-transform.trainslation.y","缩放动画-trainsform.scale","旋转动画-trainsform.rotation","颜色动画-backgroundColor","颜色动画-borderColor","淡入淡出动画-opacity","圆角动画-cornerRadius","边框动画-borderWidth","阴影动画-shadowOffset","关键帧动画-淡出", "组合动画效果"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        title = "CALayer层常用动画"
        
        buildTableView()
        buildShowBtn()
    }
    
    func buildTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: WgWith, height: WgHeight/2))
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
    }
    
    func buildShowBtn() {
        
        if (showBtn != nil) {
            showBtn.removeFromSuperview()
        }
        showBtn = UIButton(frame: CGRect(x: WgWith/4, y: WgHeight*3/4, width: WgWith/2, height: 30))
        showBtn.backgroundColor = UIColor.red
        showBtn.setTitleColor(UIColor.black, for: .normal)
        showBtn.setTitle("登录", for: .normal)
        view.addSubview(showBtn)
    }
    
    //返回动画
    func animationMethod(keyPath: String, fromValue: Any?, toValue: Any?, duration: CFTimeInterval) -> CABasicAnimation {
        
        let ani = CABasicAnimation()
        ani.keyPath = keyPath
        ani.fromValue = fromValue
        ani.toValue = toValue
        ani.duration = duration
        ani.fillMode = .forwards
        ani.isRemovedOnCompletion = false
        return ani
    }
}

extension WGCALayerAnimationViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = self.dataArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            //位置动画
            buildShowBtn()
//            let positionX = showBtn.x+showBtn.width/2+WgWith/4
//            let positionY = showBtn.y+showBtn.height/2+100
            let positionX = showBtn.x+showBtn.width/2
            let positionY = showBtn.y+showBtn.height/2
            let toValue = NSValue(cgPoint: CGPoint(x: positionX, y: positionY))
            let ani = animationMethod(keyPath: "position", fromValue: nil, toValue: toValue, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 1:
            //位置动画
            buildShowBtn()
            let ani = animationMethod(keyPath: "transform.translation.x", fromValue: nil, toValue: WgWith/4, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 2:
            //缩放动画
            buildShowBtn()
            let ani = animationMethod(keyPath: "transform.scale", fromValue: 1.0, toValue: 1.5, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 3:
            //旋转动画
            buildShowBtn()
            //旋转90°
            let ani = animationMethod(keyPath: "transform.rotation", fromValue: nil, toValue: Double.pi/2, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 4:
            //颜色动画
            buildShowBtn()
            //"backgroundColor"
            let ani = animationMethod(keyPath: "backgroundColor", fromValue: UIColor.red.cgColor, toValue: UIColor.green.cgColor, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 5:
            //颜色动画
            buildShowBtn()
            showBtn.layer.borderWidth = 5
            //"borderColor"
            let ani = animationMethod(keyPath: "borderColor", fromValue: UIColor.red.cgColor, toValue: UIColor.green.cgColor, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 6:
            //淡入淡出动画
            buildShowBtn()
            let ani = animationMethod(keyPath: "opacity", fromValue: UIColor.green.cgColor, toValue: 1.0, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 7:
            //圆角动画
            buildShowBtn()
            let ani = animationMethod(keyPath: "cornerRadius", fromValue: nil, toValue: 15, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 8:
            //边框动画
            buildShowBtn()
            let ani = animationMethod(keyPath: "borderWidth", fromValue: nil, toValue: 5, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 9:
            //阴影动画
            buildShowBtn()
            showBtn.layer.shadowColor = UIColor.green.cgColor
            showBtn.layer.shadowOpacity = 0.5
            let toValue = NSValue(cgSize: CGSize(width: -10, height: 10))
            let ani = animationMethod(keyPath: "shadowOffset", fromValue: nil, toValue: toValue, duration: 2)
            showBtn.layer.add(ani, forKey: nil)
            
        case 10:
            //关键帧动画-淡出
            buildShowBtn()
            let arr = [
                NSNumber(value: 0.9),
                NSNumber(value: 0.8),
                NSNumber(value: 0.7),
                NSNumber(value: 0.6),
                NSNumber(value: 0.5),
                NSNumber(value: 0.4),
                NSNumber(value: 0.3),
                NSNumber(value: 0.2),
                NSNumber(value: 0.1),
                NSNumber(value: 0)
            ];
            let ani = CAKeyframeAnimation()
            ani.keyPath = "opacity"
            ani.values = arr
            ani.duration = 6
            ani.isRemovedOnCompletion = false
            ani.fillMode = .forwards
            showBtn.layer.add(ani, forKey: nil)
            
        case 11:
            //组合动画
            buildShowBtn()
            
            let rotationAni = animationMethod(keyPath: "transform.rotation", fromValue: nil, toValue: Double.pi/2, duration: 2)
            let scaleAni = animationMethod(keyPath: "transform.scale", fromValue: 1.0, toValue: 0, duration: 2)
            let transformAni = animationMethod(keyPath: "transform.translation", fromValue: nil, toValue: NSValue(cgPoint: CGPoint(x: 217, y: -200)), duration: 2)
            
            let aniGroup = CAAnimationGroup()
            aniGroup.animations = [rotationAni, scaleAni, transformAni]
            aniGroup.duration = 2
            aniGroup.fillMode = .forwards
            aniGroup.isRemovedOnCompletion = false
            showBtn.layer.add(aniGroup, forKey: nil)
            
        default:
            break
        }
        
    }
}
