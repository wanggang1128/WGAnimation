//
//  WGReplicatorViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/29.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGReplicatorViewController.h"

@interface WGReplicatorViewController ()

@end

@implementation WGReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"跳动的音符";
    self.view.backgroundColor = [UIColor blackColor];
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = UIColor.orangeColor.CGColor;
    layer.frame = CGRectMake(15, 100, 10, 100);
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceDelay = 0.2;
    replicatorLayer.frame = CGRectMake(0, Height_NavBar, SCREEN_WIDTH, 200);
    replicatorLayer.masksToBounds = YES;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    replicatorLayer.backgroundColor = UIColor.blackColor.CGColor;
    [self.view.layer addSublayer:replicatorLayer];
    
    [replicatorLayer addSublayer:layer];
    
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath = @"position.y";
    ani.fromValue = @(200);
    ani.toValue = @(150);
    ani.duration = 0.3;
    ani.repeatCount = MAXFLOAT;
    ani.autoreverses = YES;
    [layer addAnimation:ani forKey:nil];
    
}



@end
