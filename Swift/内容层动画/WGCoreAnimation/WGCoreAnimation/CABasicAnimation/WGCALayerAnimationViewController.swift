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
    let dataArr = ["位置动画-position","位置动画-transform.trainslation.x","缩放动画-trainsform.scale.x","旋转动画-trainsform.rotation","颜色动画-backgroundColor","颜色动画-borderColor","淡入淡出动画-opacity","圆角动画-cornerRadius","边框动画-borderWidth","阴影动画-shadowOffset"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        
        buildBaseView()

    }
    
    func buildBaseView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: WgWith, height: WgHeight/2))
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.addSubview(tableView)
        
        showBtn = UIButton(frame: CGRect(x: WgWith/4, y: WgHeight*3/4, width: WgWith/2, height: 30))
        showBtn.backgroundColor = UIColor.cyan
        showBtn.setTitle("登录", for: .normal)
        view.addSubview(showBtn)
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
    }
}
