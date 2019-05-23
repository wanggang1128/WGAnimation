//
//  WGNeonAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/23.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGNeonAniViewController.h"

@interface WGNeonAniViewController ()

@property (nonatomic, strong) CAEmitterLayer *emitterLayer;
@property (nonatomic, strong) CAEmitterCell *emitterCell;

@end

@implementation WGNeonAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"霓虹效果";
    self.view.backgroundColor = UIColor.blackColor;
    
    //粒子发射器
    self.emitterLayer = [CAEmitterLayer layer];
    //粒子发射位置
    _emitterLayer.position = self.view.center;
    //控制大小
    _emitterLayer.emitterSize = CGSizeMake(2, 2);
    _emitterLayer.renderMode = kCAEmitterLayerBackToFront;
    //控制发射源模式 即形状
    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    _emitterLayer.emitterShape = kCAEmitterLayerCircle;
    [self.view.layer addSublayer:_emitterLayer];
    
    self.emitterCell = [[CAEmitterCell alloc] init];
    _emitterCell.name = @"nenolight";
    //发射方向
    _emitterCell.emissionLongitude = M_PI;
    //粒子速度
    _emitterCell.velocity = 50;
    //粒子速度范围
    _emitterCell.velocityRange = 50;
    //缩放比例
    _emitterCell.scaleSpeed = -0.2;
    _emitterCell.scale = 0.1;
    _emitterCell.greenSpeed = -0.1;
    _emitterCell.alphaSpeed = -0.2;
    _emitterCell.birthRate = 100;
    _emitterCell.lifetime = 4;
    //颜色
    _emitterCell.color = [UIColor whiteColor].CGColor;
    
    _emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"nenolight.png"].CGImage);
    
    _emitterLayer.emitterCells = @[_emitterCell];
}



@end
