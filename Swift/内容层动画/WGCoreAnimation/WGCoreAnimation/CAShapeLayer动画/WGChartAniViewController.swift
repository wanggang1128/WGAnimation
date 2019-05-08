//
//  WGChartAniViewController.swift
//  WGCoreAnimation
//
//  Created by wanggang on 2019/5/7.
//  Copyright © 2019 wanggang. All rights reserved.
//

import UIKit

class WGChartAniViewController: UIViewController {

    var lineChart: WGLineChartView!
    var barChart: WGBarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "图表动画"
        
        lineChart = WGLineChartView(frame: self.view.bounds)
        barChart = WGBarChartView(frame: CGRect(x: 0, y: WgHeight/2, width: WgWith, height: WgHeight))
        view.addSubview(lineChart)
        view.addSubview(barChart)
        buildView()
    }
    
    func buildView() {
        
        let width: CGFloat = 70
        let height: CGFloat = 20
        
        for i in 1...5 {
            let title = "value"+"\(i)"
            let label = UILabel(frame: CGRect(x: 30+(CGFloat(i)-1)*70, y: 300, width: width, height: height))
            label.text = title
            view.addSubview(label)
        }
        
        for i in 0...5{
            let title = "\(10-i*2)"
            let label = UILabel(frame: CGRect(x: 5,y: 120+(CGFloat(i)-1)*35, width: 20, height: 20))
            label.text = title
            self.view.addSubview(label)
        }
        
        let lineBtn = UIButton(frame: CGRect(x: (WgWith-100)/2, y: 320, width: 100, height: 30))
        lineBtn.setTitle("开始", for: .normal)
        lineBtn.setTitleColor(UIColor.purple, for: .normal)
        lineBtn.backgroundColor = UIColor.yellow
        lineBtn.addTarget(self, action: #selector(lineBtnClicked), for: .touchUpInside)
        view.addSubview(lineBtn)
        
        //      BarChart
        for i in 1...5{
            let xAxesTitle:String = "SEP"+"\(i)"
            let xAxesLabel:UILabel = UILabel(frame: CGRect(x: 40+(CGFloat(i)-1)*70,y: 600, width: 50, height: 20))
            xAxesLabel.text = xAxesTitle
            self.view.addSubview(xAxesLabel)
        }
    }
    
    @objc func lineBtnClicked() {
        
        lineChart.chartAniStart()
        barChart.barAniStart()
    }
}
