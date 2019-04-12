//
//  WGMaskViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/9/3.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGMaskViewController.h"

@interface WGMaskViewController ()

@property (nonatomic, strong) UIImageView *planeImageView;
@property (nonatomic, strong) CALayer *maskLayer;

@end

@implementation WGMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGMaskViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.planeImageView];
    [self.view.layer addSublayer:self.maskLayer];

    self.maskLayer.position = self.view.center;
    self.planeImageView.layer.mask = self.maskLayer;
    [self.maskLayer addAnimation:[self maskAnimation] forKey:nil];
    
}

- (CAKeyframeAnimation *)maskAnimation{
    //放大缩小视图，keypath使用bounds
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    //动画时间
    animation.duration = 1;
    //延迟0.5秒播放
    animation.beginTime = CACurrentMediaTime() + 0.5;
    
    //设置关键帧动画的数值
    CGRect startRect = self.maskLayer.frame;
    CGRect tempRect = CGRectMake(0, 0, 100, 100);
    CGRect finalRect = CGRectMake(0, 0, 2000, 2000);
    animation.values = @[[NSValue valueWithCGRect:startRect],[NSValue valueWithCGRect:tempRect],[NSValue valueWithCGRect:finalRect]];
    
    //设置关键帧动画的运动节奏
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    //动画播放结束后是否移除动画
    animation.removedOnCompletion = NO;

    //动画填充模式：kCAFillModeForwards:当动画结束后，layer会一直保持着动画最后的状态
    animation.fillMode = kCAFillModeForwards;
    
    return animation;

}

#pragma mark -懒加载
- (UIImageView *)planeImageView{
    if (!_planeImageView) {
        _planeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WGWIDTH, WGHEIGHT)];
        _planeImageView.backgroundColor = [UIColor cyanColor];
        _planeImageView.image = [UIImage imageNamed:@"backgroundimg.png"];
    }
    return _planeImageView;
}

-(CALayer *)maskLayer{
    if (!_maskLayer) {
        _maskLayer = [[CALayer alloc] init];
        _maskLayer.bounds = CGRectMake(0, 0, 50, 50);
        
        _maskLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"logo"].CGImage);
    }
    return _maskLayer;
}













@end
