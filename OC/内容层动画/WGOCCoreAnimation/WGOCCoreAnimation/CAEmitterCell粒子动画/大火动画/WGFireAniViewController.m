//
//  WGFireAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/23.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGFireAniViewController.h"

@interface WGFireAniViewController ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;
@property (nonatomic, strong) CAEmitterCell *emitterCell;

@end

@implementation WGFireAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"大火动画";
    self.view.backgroundColor = UIColor.blackColor;
    
    //粒子发射器
    self.emitterLayer = [CAEmitterLayer layer];
    //粒子发射位置
    _emitterLayer.position = self.view.center;
    //控制火苗大小
    _emitterLayer.emitterSize = CGSizeMake(SCREEN_WIDTH, 30);
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    //控制发射源模式 即形状
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    [self.view.layer addSublayer:_emitterLayer];
    
    self.emitterCell = [[CAEmitterCell alloc] init];
    _emitterCell.name = @"fire";
    //发射方向
    _emitterCell.emissionLongitude = M_PI;
    //粒子速度 负数表明向上燃烧
    _emitterCell.velocity = -10;
    //粒子速度范围
    _emitterCell.velocityRange = 20;
    //周围发射角度
    _emitterCell.emissionRange = 1.5;
    //粒子y方向的加速度分量
    _emitterCell.yAcceleration = -100;
    //缩放比例 超大火苗
    _emitterCell.scaleSpeed = 1.2;
    //火苗颜色
    _emitterCell.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    _emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire.png"].CGImage);
    
    _emitterLayer.emitterCells = @[_emitterCell];
    [_emitterLayer setValue:@(500) forKeyPath:@"emitterCells.fire.birthRate"];
    [_emitterLayer setValue:@(1) forKeyPath:@"emitterCells.fire.lifetime"];
    
}



@end
