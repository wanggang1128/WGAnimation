//
//  WGCAKeyframeAnimationViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/9/3.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGCAKeyframeAnimationViewController.h"

@interface WGCAKeyframeAnimationViewController ()

@property (nonatomic, strong) UIImageView *planeImageView;

@end

@implementation WGCAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGCAKeyframeAnimationViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test01];
//    [self test02];
}

//动画组实验,创建一个缩放/旋转/按一定路线旋转的框
- (void)test02{
    CALayer *layer = [self buildLayerWithPosition:self.view.center backGroundColor:[UIColor redColor]];
    layer.bounds = CGRectMake(0, 0, 150, 150);
    [self.view.layer addSublayer:layer];
    
    //实例化一个组动画对象
    CAAnimationGroup *groupAni = [[CAAnimationGroup alloc] init];
    //添加缩放
    CABasicAnimation *one = [self buildAnimationWithKeyPath:@"transform.scale" to:0.2];
    //添加旋转
    CABasicAnimation *two = [self buildAnimationWithKeyPath:@"transform.rotation" to:M_PI*2];
    //创建按照路径移动的动画
    CAKeyframeAnimation *three = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    three.path = path.CGPath;
    three.calculationMode = kCAAnimationPaced;
    three.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //将旋转、缩放、移动的动画添加到组动画中
    groupAni.animations = @[one, two, three];
    //重复次数
    groupAni.repeatCount = CGFLOAT_MAX;
    //持续时间
    groupAni.duration = 2;
    
    //为layer添加动画
    [layer addAnimation:groupAni forKey:nil];
}

//创建抖动框和飞机
- (void)test01{
    
    CALayer *subLayer = [self buildLayerWithPosition:CGPointMake(100, 200) backGroundColor:[UIColor yellowColor]];
    [subLayer addAnimation:[self buildShakeAnimation] forKey:nil];
    [self.view.layer addSublayer:subLayer];
    
    //将小飞机添加到视图上
    [self.view addSubview:self.planeImageView];
    //设置小飞机的位置
    self.planeImageView.bounds = CGRectMake(0, 0, 50, 50);
    self.planeImageView.center = self.view.center;
    //为小飞机同时添加抖动的动画和椭圆路径旋转的动画
    [self.planeImageView.layer addAnimation:[self buildShakeAnimation] forKey:nil];
    [self.planeImageView.layer addAnimation:[self buildOvalAnimation] forKey:nil];
}

//创建抖动动画
- (CAKeyframeAnimation *)buildShakeAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    //设置一些列的关键帧动画
    animation.values = @[@(-M_PI_4 / 5),@(M_PI_4 / 5),@(-M_PI_4 / 5)];
    animation.repeatCount = CGFLOAT_MAX;
    animation.duration = 0.5;
    return animation;
}

//创建椭圆形状的动画
- (CAKeyframeAnimation *)buildOvalAnimation{
    
    //创建关键帧动画对象。按照指定的路径进行移动，所以需要设置为position
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建一个椭圆的beziperPath
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 500)];
    //直角转向
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 500)];
    //有一定角度转向
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 200, 500) cornerRadius:0];
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:150 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    //把路径添加到动画上
    animation.path = path.CGPath;
    animation.repeatCount = CGFLOAT_MAX;
    //动画播放时长
    animation.duration = 4;
    //动画的计算模式
    animation.calculationMode = kCAAnimationPaced;
    //动画是否沿着路径旋转
    animation.rotationMode = kCAAnimationRotateAutoReverse;
    return animation;
}

//旋转,缩放动画
- (CABasicAnimation *)buildAnimationWithKeyPath:(NSString *)keyPath to:(CGFloat)to{
    //创建动画对象
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    //动画属性
    animation.keyPath = keyPath;
    //动画结束后，layer所在的位置
    animation.toValue = @(to);
    //动画持续时间
    animation.duration = 2;
    //动画重复次数
    animation.repeatCount = CGFLOAT_MAX;
    
    return animation;
}

#pragma mark -创建CALayer
- (CALayer *)buildLayerWithPosition:(CGPoint)position backGroundColor:(UIColor *)color{
    //创建Layer
    CALayer *layer = [[CALayer alloc] init];
    //设置大小
    layer.bounds = CGRectMake(0, 0, 50, 50);
    //设置位置
    layer.position = position;
    //设置背景颜色
    layer.backgroundColor = color.CGColor;
    
    return layer;
}

#pragma mark - 懒加载
- (UIImageView *)planeImageView{
    if (!_planeImageView) {
        _planeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"feiji"]];
        
        _planeImageView.backgroundColor = [UIColor whiteColor];
    }
    return _planeImageView;
}


@end
