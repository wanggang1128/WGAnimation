//
//  WGScanAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/24.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGScanAniViewController.h"

@interface WGScanAniViewController ()

@end

@implementation WGScanAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"扫描动画";
    self.view.backgroundColor = [UIColor blackColor];
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = CGRectMake((SCREEN_WIDTH-200)/2, 200, 200, 200);
    [self.view.layer addSublayer:layer];
    
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
    layer.locations = @[@(0.0), @(0.05), @(0.1)];
    
    layer.colors = @[(id)UIColor.whiteColor.CGColor, (id)UIColor.redColor.CGColor, (id)UIColor.whiteColor.CGColor];
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = @"locations";
    ani.fromValue = @[@(0.0), @(0.05), @(0.1)];
    ani.toValue = @[@(0.9), @(0.95), @(1)];
    ani.duration = 3;
    ani.repeatCount = 100;
    [layer addAnimation:ani forKey:nil];
}



@end
