//
//  WGButtnAniView.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/24.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGButtnAniView: UIView {

    var startColor = UIColor.cyan
    var finishColor = UIColor.yellow
    
    //内容视图
    var contentView: UIView?
    //边框视图
    var borderView: UIView?
    //标题
    var titleLabel: UILabel?
    //展示进度的视图
    var circleView: WGCircleAniView?

    var btnX: CGFloat = 0;
    var btnY: CGFloat = 0;
    var btnW: CGFloat = 0;
    var btnH: CGFloat = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        btnX = self.frame.origin.x
        btnY = self.frame.origin.y
        btnW = self.frame.size.width
        btnH = self.frame.size.height
        
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        contentView?.backgroundColor = startColor
        self.addSubview(contentView!)
        
        borderView = UIView(frame: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        borderView?.backgroundColor = UIColor.clear
        borderView?.layer.borderWidth = 3
        borderView?.layer.borderColor = startColor.cgColor
        self.addSubview(borderView!)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        titleLabel?.text = "开始"
        titleLabel?.textColor = UIColor.black
        titleLabel?.backgroundColor = UIColor.clear
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(titleLabel!)
        
        circleView = WGCircleAniView(frame: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        circleView?.wgCircleAniViewDelegate = self
        self.addSubview(circleView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //返回动画
    func getBasicAnimation(keyPath: String, fromValue: Any?, toValue: Any?) -> CABasicAnimation {
        
        let ani = CABasicAnimation()
        ani.keyPath = keyPath
        ani.fromValue = fromValue
        ani.toValue = toValue
        return ani
    }
    
    func startAnimation() {
        
        /*
         由 按钮->透明的灰色框  动画动画可拆解为两部分
         一:contentView渐变成一个圆且淡出
         二:borderView渐变成一个圆框且变成灰色
         */
        self.isUserInteractionEnabled = false
        titleLabel?.isHidden = true
        //调整大小
        let toValue = NSValue(cgRect: CGRect(x: btnX+(btnW-btnH)/2, y: btnH, width: btnH, height: btnH))
        let boundsAni = getBasicAnimation(keyPath: "bounds", fromValue: nil, toValue: toValue)
        
        //圆角
        let cornerRadiusAni = getBasicAnimation(keyPath: "cornerRadius", fromValue: 0, toValue: btnH/2)
        
        //淡出
        let opacityAni = getBasicAnimation(keyPath: "opacity", fromValue: nil, toValue: 0)
        
        //动画组:contentView渐变成一个圆且淡出
        let conAniGroup = CAAnimationGroup()
        conAniGroup.animations = [boundsAni, cornerRadiusAni, opacityAni]
        conAniGroup.duration = 1
        conAniGroup.repeatCount = 1
        conAniGroup.fillMode = .forwards
        conAniGroup.isRemovedOnCompletion = false
        conAniGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        contentView?.layer.add(conAniGroup, forKey: nil)
        
        //边框颜色渐变
        let borderColorAni = getBasicAnimation(keyPath: "borderColor", fromValue: nil, toValue: UIColor.lightGray.cgColor)
        
        //动画组:borderView渐变成一个圆框且变成灰色
        let borAniGroup = CAAnimationGroup()
        borAniGroup.animations = [boundsAni, cornerRadiusAni, borderColorAni]
        borAniGroup.duration = 1
        borAniGroup.repeatCount = 1
        borAniGroup.fillMode = .forwards
        borAniGroup.isRemovedOnCompletion = false
        borAniGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        borAniGroup.delegate = self
        borAniGroup.setValue("startAnimationValue", forKey: "startAnimationKey")
        borderView?.layer.add(borAniGroup, forKey: "startAnimationValue")
        
    }
    
    func startAnimationReset() {
        
        self.isUserInteractionEnabled = false
        //调整大小
        let fromValue = NSValue(cgRect: CGRect(x: btnX+(btnW-btnH)/2, y: btnH, width: btnH, height: btnH))
        let toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: btnW, height: btnH))
        let boundsAni = getBasicAnimation(keyPath: "bounds", fromValue: fromValue, toValue: toValue)
        
        //去圆角
        let cornerRadiusAni = getBasicAnimation(keyPath: "cornerRadius", fromValue: btnH/2, toValue: 0)
        
        //淡入
        let opacityAni = getBasicAnimation(keyPath: "opacity", fromValue: nil, toValue: 1)
        
        //改变下背景色,区别已完成
        let backGroundColorAni = getBasicAnimation(keyPath: "backgroundColor", fromValue: nil, toValue: finishColor.cgColor)
        
        //动画组:contentView渐变成原来形状且改变背景色
        let conAniGroup = CAAnimationGroup()
        conAniGroup.animations = [boundsAni, cornerRadiusAni, opacityAni, backGroundColorAni]
        conAniGroup.duration = 3
        conAniGroup.repeatCount = 1
        conAniGroup.fillMode = .forwards
        conAniGroup.isRemovedOnCompletion = false
        conAniGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        contentView?.layer.add(conAniGroup, forKey: nil)
        
        //边框颜色渐变
        let borderColorAni = getBasicAnimation(keyPath: "borderColor", fromValue: nil, toValue: finishColor.cgColor)
        
        //动画组:borderView由灰色框恢复为原形状
        let borAniGroup = CAAnimationGroup()
        borAniGroup.animations = [boundsAni, cornerRadiusAni, borderColorAni]
        borAniGroup.duration = 3
        borAniGroup.repeatCount = 1
        borAniGroup.fillMode = .forwards
        borAniGroup.isRemovedOnCompletion = false
        borAniGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        borAniGroup.delegate = self
        borAniGroup.setValue("startAnimationResetValue", forKey: "startAnimationResetKey")
        borderView?.layer.add(borAniGroup, forKey: "startAnimationResetValue")
        
    }
    
}

//动画代理
extension WGButtnAniView: CAAnimationDelegate{
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if flag {
            let aniType = anim.value(forKey: "startAnimationKey")
            let aniType01 = anim.value(forKey: "startAnimationResetKey")
            if let type = aniType {
                if (type as! NSString).isEqual(to: "startAnimationValue"){
                    //开始进度动画
                    circleView?.startCircleAnimation()
                }
            }else if let type = aniType01 {
                
                if (type as! NSString).isEqual(to: "startAnimationResetValue"){
                    
                    self.isUserInteractionEnabled = true
                    titleLabel?.text = "完成"
                    titleLabel?.isHidden = false
                }
            }
        }
    }
}

//进度圆环代理
extension WGButtnAniView: WGCircleAniViewDelegate{
    
    func circleAniStop() {
        //还原之前形状
        circleView?.removeFromSuperview()
        startAnimationReset()
    }
}
