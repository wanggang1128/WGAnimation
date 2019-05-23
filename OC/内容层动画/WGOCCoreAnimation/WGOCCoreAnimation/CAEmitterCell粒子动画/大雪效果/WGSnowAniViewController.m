//
//  WGSnowAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/23.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGSnowAniViewController.h"

@interface WGSnowAniViewController ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;
@property (nonatomic, strong) CAEmitterCell *emitterCell;

@end

@implementation WGSnowAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"大雪效果";
    self.view.backgroundColor = UIColor.blackColor;
    
    //粒子发射器图层
    self.emitterLayer = [CAEmitterLayer layer];
    //粒子发射器位置
    _emitterLayer.emitterPosition = CGPointMake(0, -30);
    //粒子发射器的范围
    _emitterLayer.emitterSize = CGSizeMake(SCREEN_WIDTH*2, 0);
    //发射模式
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    //粒子模式
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    self.emitterCell = [CAEmitterCell emitterCell];
    _emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snow"].CGImage);
    //设置粒子缩放比例
    _emitterCell.scale = 0.02;
    //缩放范围
    _emitterCell.scaleRange = 0.5;
    //每秒粒子产生数量
    _emitterCell.birthRate = 100;
    //粒子生命周期
    _emitterCell.lifetime = 80;
    //粒子透明速度
    _emitterCell.alphaSpeed = -0.01;
    //粒子速度
    _emitterCell.velocity = 80;
    _emitterCell.velocityRange = 50;
    //设置角度
    _emitterCell.emissionRange = M_PI;
    //设置粒子旋转角速度
    _emitterCell.spin = M_PI_4;
    
    _emitterLayer.emitterCells = @[_emitterCell];
    
    [self.view.layer addSublayer:_emitterLayer];
}



@end
