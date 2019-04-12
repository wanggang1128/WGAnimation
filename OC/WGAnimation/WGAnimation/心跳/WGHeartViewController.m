//
//  WGHeartViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/20.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGHeartViewController.h"

@interface WGHeartViewController ()

@end

@implementation WGHeartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGHeartViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildLayer];
    [self buildImgView];
}

//使用layer创建心跳
- (void)buildLayer{
    UIImage *heartImg = [UIImage imageNamed:@"heart.jpeg"];
    //设置图层
    CALayer *subLayer = [self buildLayerWithPosition:CGPointMake(self.view.center.x, 100) backGroundColor:[UIColor yellowColor]];
    //图层绘制图片
    subLayer.contents = (__bridge id _Nullable)(heartImg.CGImage);
    //创建动画
    [subLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale" to:0.5] forKey:nil];
    [self.view.layer addSublayer:subLayer];
}

//使用imageView创建心跳
- (void)buildImgView{
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    img.image = [UIImage imageNamed:@"heart.jpeg"];
    [self.view addSubview:img];
    [img.layer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale" to:0.5] forKey:nil];
}

#pragma mark -创建CALayer
- (CALayer *)buildLayerWithPosition:(CGPoint)position backGroundColor:(UIColor *)color{
    //创建Layer
    CALayer *layer = [[CALayer alloc] init];
    //设置大小
    layer.bounds = CGRectMake(0, 0, 100, 100);
    //设置位置
    layer.position = position;
    //设置背景颜色
    layer.backgroundColor = color.CGColor;
    
    return layer;
}

#pragma mark -创建动画
//旋转,缩放动画
- (CABasicAnimation *)buildAnimationWithKeyPath:(NSString *)keyPath to:(CGFloat)to{
    //创建动画对象
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    //动画属性
    animation.keyPath = keyPath;
    //动画结束后，layer所在的位置
    animation.toValue = @(to);
    //动画持续时间
    animation.duration = 1;
    //动画重复次数
    animation.repeatCount = CGFLOAT_MAX;
    //动画的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    return animation;
}

@end
