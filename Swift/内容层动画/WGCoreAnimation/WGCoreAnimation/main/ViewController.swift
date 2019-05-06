//
//  ViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/4/23.
//  Copyright © 2019 bozhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WgWith, height: WgHeight))
    let dataArr = ["CALayer层动画", "水纹动画", "渐进圆环动画", "大火动画", "霓虹动画", "大雪动画", "扫描动画", "跳动动画"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "列表"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
}

//MARK:- UIViewTableView DataSource & Delegate
// 知识点：扩展
// 扩展和 Objective-C 中的分类类似，但没有名称
// 扩展可以为一个类型添加新的功能，但是不能重写已有的功能。
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = WGCALayerAnimationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = WGWaterWaveBtnViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let vc = WGCircleBtnAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            let vc = WGFireAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            let vc = WGNeonAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let vc = WGSnowAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 6:
            let vc = WGScanAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 7:
            let vc = WGBeatAniViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}
