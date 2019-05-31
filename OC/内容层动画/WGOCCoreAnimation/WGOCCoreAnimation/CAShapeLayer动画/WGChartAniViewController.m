//
//  WGChartAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/27.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGChartAniViewController.h"
#import "WGLineChartView.h"
#import "WGBarChartView.h"

@interface WGChartAniViewController ()

@property (nonatomic, strong) WGLineChartView *lineView;
@property (nonatomic, strong) WGBarChartView *barView;

@end

@implementation WGChartAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图表动画";
    self.view.backgroundColor = [UIColor blackColor];

    self.lineView = [[WGLineChartView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    [self.view addSubview:_lineView];
    
    self.barView = [[WGBarChartView alloc] initWithFrame:CGRectMake(0, _lineView.bottom, SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    [self.view addSubview:_barView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, _barView.bottom, SCREEN_WIDTH, 50)];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.yellowColor];
    [btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClicked{
    
    _lineView.pointArr = @[
                           [NSValue valueWithCGPoint:CGPointMake(30+35, 260)],
                           [NSValue valueWithCGPoint:CGPointMake(100+35, 100)],
                           [NSValue valueWithCGPoint:CGPointMake(170+35, 240)],
                           [NSValue valueWithCGPoint:CGPointMake(240+35, 170)],
                           [NSValue valueWithCGPoint:CGPointMake(310+35, 220)]
                           ];
    _lineView.lineColor = UIColor.greenColor;
    [_lineView startAni];
    
    _barView.pointArr = @[
                          @[
                              [NSValue valueWithCGPoint:CGPointMake(60, 215)],
                              [NSValue valueWithCGPoint:CGPointMake(60, 100)],
                              ],
                          @[
                              [NSValue valueWithCGPoint:CGPointMake(130, 215)],
                              [NSValue valueWithCGPoint:CGPointMake(130, 120)],
                              ],
                          @[
                              [NSValue valueWithCGPoint:CGPointMake(200, 215)],
                              [NSValue valueWithCGPoint:CGPointMake(200, 140)],
                              ],
                          @[
                              [NSValue valueWithCGPoint:CGPointMake(270, 215)],
                              [NSValue valueWithCGPoint:CGPointMake(270, 160)],
                              ],
                          @[
                              [NSValue valueWithCGPoint:CGPointMake(340, 215)],
                              [NSValue valueWithCGPoint:CGPointMake(340, 180)],
                              ],
                          ];
    _barView.lineColor = UIColor.purpleColor;
    [_barView startAni];
}



@end
