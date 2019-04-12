//
//  WGTranslationViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/20.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGTranslationViewController.h"

@interface WGTranslationViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *redLayer;
@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) CALayer *greenLayer;
@property (nonatomic, strong) CALayer *blackLayer;


@end

@implementation WGTranslationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self addLayer];
}

- (void)buildView{
    self.title = @"WGTranslationViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i<3; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100*i, WGHEIGHT-30, 100, 30)];
        btn.backgroundColor = [UIColor brownColor];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        switch (i) {
            case 0:{
                [btn setTitle:@"平移" forState:UIControlStateNormal];
                break;
            }
            case 1:{
                [btn setTitle:@"缩放" forState:UIControlStateNormal];
                break;
            }case 2:{
                [btn setTitle:@"旋转" forState:UIControlStateNormal];
                break;
            }
            default:
                break;
        }
        [self.view addSubview:btn];
    }
}

- (void)btnClicked:(UIButton *)sender{
    if (sender.tag == 0) {
        [self addPingYiAni];
    }else if (sender.tag == 1){
        [self addSuoFangAni];
    }else{
        [self addXuanZhuanAni];
    }
}

//添加layer
- (void)addLayer{
    
    self.redLayer = [self buildLayerWithPosition:CGPointMake(100, 100) backGroundColor:[UIColor redColor]];
    self.blueLayer = [self buildLayerWithPosition:CGPointMake(100, 250) backGroundColor:[UIColor blueColor]];
    self.greenLayer = [self buildLayerWithPosition:CGPointMake(100, 400) backGroundColor:[UIColor greenColor]];
    self.blackLayer = [self buildLayerWithPosition:CGPointMake(100, 550) backGroundColor:[UIColor blackColor]];
    
    [self.view.layer addSublayer:self.redLayer];
    [self.view.layer addSublayer:self.blueLayer];
    [self.view.layer addSublayer:self.greenLayer];
    [self.view.layer addSublayer:self.blackLayer];
}
//添加旋转动画
- (void)addXuanZhuanAni{
    
    [self.redLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.rotation.x" to:M_PI_2] forKey:nil];
    [self.blueLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.rotation.y" to:M_PI_2] forKey:nil];
    [self.greenLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.rotation.z" to:M_PI_2] forKey:nil];
    [self.blackLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.rotation" to:M_PI_2] forKey:nil];
}

//添加缩放动画
- (void)addSuoFangAni{

    [self.redLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale.x" to:0.5] forKey:nil];
    [self.blueLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale.y" to:0.5] forKey:nil];
    [self.greenLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale.z" to:0.5] forKey:nil];
    [self.blackLayer addAnimation:[self buildAnimationWithKeyPath:@"transform.scale" to:0.5] forKey:nil];
}

//添加平移动画
- (void)addPingYiAni{
 
    [self.redLayer addAnimation:[self buildAnimationFrom:CGPointMake(0, 100) to:CGPointMake(300, 100) timingFunction:kCAMediaTimingFunctionLinear] forKey:@"linear"];
    [self.blueLayer addAnimation:[self buildAnimationFrom:CGPointMake(0, 200) to:CGPointMake(300, 200) timingFunction:kCAMediaTimingFunctionEaseIn] forKey:@"easeIn"];
    [self.greenLayer addAnimation:[self buildAnimationFrom:CGPointMake(0, 300) to:CGPointMake(300, 300) timingFunction:kCAMediaTimingFunctionEaseOut] forKey:@"easeOut"];
    [self.blackLayer addAnimation:[self buildAnimationFrom:CGPointMake(0, 400) to:CGPointMake(300, 400) timingFunction:kCAMediaTimingFunctionEaseInEaseOut] forKey:@"easeInEaseOut"];
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
//平移动画
- (CABasicAnimation *)buildAnimationFrom:(CGPoint)from to:(CGPoint)to timingFunction:(NSString *)name{
    //创建动画对象
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    //动画属性
    animation.keyPath = @"position";
    //动画起始位置,从哪里开始
    animation.fromValue = [NSValue valueWithCGPoint:from];
    //动画结束后，layer所在的位置
    animation.toValue = [NSValue valueWithCGPoint:to];
    //动画持续时间
    animation.duration = 15;
    //动画重复次数
    animation.repeatCount = CGFLOAT_MAX;
    //CAAnimationDelegate代理
    animation.delegate = self;
    //速度控制
    animation.timingFunction = [CAMediaTimingFunction functionWithName:name];
    
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
    animation.duration = 10;
    //动画重复次数
    animation.repeatCount = CGFLOAT_MAX;
    
    return animation;
}
#pragma 实现代理协议的方法
//动画开始的时候调用
- (void)animationDidStart:(CAAnimation *)anim{

//    self.layer.position = CGPointMake(300, 100);
}

//动画结束的时候调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{

//    self.layer.position = CGPointMake(300, 400);
    [self.redLayer removeAllAnimations];
    [self.blueLayer removeAllAnimations];
    [self.greenLayer removeAllAnimations];
    [self.blackLayer removeAllAnimations];

}





@end
