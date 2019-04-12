//
//  WGLearnConceptViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/17.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGLearnConceptViewController.h"

@interface WGLearnConceptViewController ()

@end

@implementation WGLearnConceptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self buildShadowView];
}

- (void)buildView{
    self.title = @"WGLearnConceptViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -新建一个带有阴影的view
/*
 阴影颜色+阴影偏移（或者阴影路径）+阴影透明度缺一不可
 
 */
- (void)buildShadowView{
    
    UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //设置背景颜色
    shadowView.backgroundColor = [UIColor grayColor];
    
    //=====================设置阴影===========================
    
    //设置阴影路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-10, -10, shadowView.width+20, shadowView.height+20)];
    shadowView.layer.shadowPath = path.CGPath;
    
    //设置阴影颜色
    shadowView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    
    //设置阴影透明度
    shadowView.layer.shadowOpacity = 0.5;
    
    [self.view addSubview:shadowView];
    
    //=====================修改透视===========================
    
    //定义矩阵
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0/800;
    
    //旋转加透视
    transform = CATransform3DRotate(transform, -M_PI_4, 0, 1, 0);
    shadowView.layer.transform = transform;
    
    //=====================关闭隐式动画===========================
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:3 animations:^{
            //开启
            [CATransaction begin];
            //关闭动画
            [CATransaction setDisableActions:YES];
            shadowView.layer.position = CGPointMake(200, 200);
            //提交
            [CATransaction commit];
        }];
    });
    
}


#pragma mark -手动创建一个CALayer
- (void)buildLayer{
    CALayer *layer = [[CALayer alloc] init];
    
    layer.frame = CGRectMake(100, 100, 100, 100);
    
    /*
     //设置大小
     layer.bounds = CGRectMake(0, 0, 100, 100);
     
     //设置位置(默认情况下 position 指的是 center)
     layer.position = CGPointMake(150, 150);
     */
    
    //设置颜色
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    
    //透明度
    layer.opacity = 0.8;
    
    [self.view.layer addSublayer:layer];
    
    //意思就是说从{0,0,0}这个点，到{10,20,30}这个点，划一根线。图形绕着这根线，旋转M_PI_4度数。
    layer.transform = CATransform3DMakeRotation(M_PI_4, 10, 20, 30);
}

@end
