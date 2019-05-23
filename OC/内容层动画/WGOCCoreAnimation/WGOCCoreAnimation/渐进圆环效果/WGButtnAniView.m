//
//  WGButtnAniView.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGButtnAniView.h"
#import "WGCircleAniView.h"

@interface WGButtnAniView()<CAAnimationDelegate, WGCircleAniViewDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) WGCircleAniView *circleView;

@end

@implementation WGButtnAniView

@synthesize firstColor = _firstColor;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self buildBaseView];
    }
    return self;
}

- (void)buildBaseView{
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _contentView.backgroundColor = self.firstColor;
    [self addSubview:_contentView];
    
    self.circleView = [[WGCircleAniView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _circleView.circleAniViewDelegate = self;
    [self addSubview:_circleView];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _titleLab.font = [UIFont systemFontOfSize:20];
    _titleLab.textColor = [UIColor blackColor];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [self bringSubviewToFront:_titleLab];
    [self addSubview:_titleLab];
}

//返回基础动画
- (CABasicAnimation *)aniKeyPath:(NSString *)keyPath fromValue:(id)fromVal toValue:(id)toVal{
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = keyPath;
    ani.fromValue = fromVal;
    ani.toValue = toVal;
    ani.fillMode = kCAFillModeForwards;
    [ani setRemovedOnCompletion:NO];
    return ani;
}

//变圆动画
- (void)startAniDuation{
    
    self.titleLab.hidden = YES;
    self.userInteractionEnabled = NO;
    
    //调整大小
    NSValue *to = [NSValue valueWithCGRect:CGRectMake(self.x+(self.width-self.height)/2, self.height, self.height, self.height)];
    CABasicAnimation *boundsAni = [self aniKeyPath:@"bounds" fromValue:nil toValue:to];
    
    //背景色渐变透明
    CABasicAnimation *backgroundColorAni = [self aniKeyPath:@"backgroundColor" fromValue:(id)self.firstColor.CGColor toValue:(id)[UIColor clearColor].CGColor];
    
    //变圆
    CABasicAnimation *circleAni = [self aniKeyPath:@"cornerRadius" fromValue:@(0) toValue:@(self.height/2)];
    
    //边框宽度
    CABasicAnimation *borderWidthAni = [self aniKeyPath:@"borderWidth" fromValue:@(0) toValue:@(5)];
    
    //边框颜色
    CABasicAnimation *borderColorAni = [self aniKeyPath:@"borderColor" fromValue:(id)self.firstColor.CGColor toValue:(id)[UIColor lightGrayColor].CGColor];
    
    //动画组
    CAAnimationGroup *contentGroup = [[CAAnimationGroup alloc] init];
    contentGroup.animations = @[boundsAni, backgroundColorAni, circleAni, borderColorAni, borderWidthAni];
    contentGroup.duration = self.firstDuation;
    contentGroup.fillMode = kCAFillModeForwards;
    [contentGroup setRemovedOnCompletion:NO];
    contentGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    contentGroup.delegate = self;
    [contentGroup setValue:@"startAnimationValue" forKey:@"startAnimationKey"];
    
    [self.contentView.layer addAnimation:contentGroup forKey:@"startAnimationValue"];
}

//回复原状动画
- (void)resetAniDuation{
    
    //调整大小
    NSValue *to = [NSValue valueWithCGRect:CGRectMake(0, 0, self.width, self.height)];
    CABasicAnimation *boundsAni = [self aniKeyPath:@"bounds" fromValue:nil toValue:to];
    
    //恢复背景色
    CABasicAnimation *backrroundColorAni = [self aniKeyPath:@"backgroundColor" fromValue:nil toValue:(id)self.thirdColor.CGColor];
    
    //去圆角
    CABasicAnimation *circleAni = [self aniKeyPath:@"cornerRadius" fromValue:nil toValue:@(0)];
    
    //边框宽度为0
    CABasicAnimation *borderWidthAni = [self aniKeyPath:@"borderWidth" fromValue:nil toValue:@(0)];
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[boundsAni, backrroundColorAni, circleAni, borderWidthAni];
    group.duration = self.thirdDuation;
    group.fillMode = kCAFillModeForwards;
    [group setRemovedOnCompletion:NO];
    group.delegate = self;
    [group setValue:@"resetAnimationValue" forKey:@"resetAnimationKey"];
    [self.contentView.layer addAnimation:group forKey:@"resetAnimationValue"];
    
}

#pragma mark --<CAAnimationDelegate>方法
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (flag) {
        
        NSString *animType = [anim valueForKey:@"startAnimationKey"];
        if (animType && [animType isEqualToString:@"startAnimationValue"]) {
            //开始进度动画
            [self.circleView startCircleAniColor:self.secondColor duation:self.secondDuation];
        }else{
            NSString *animType = [anim valueForKey:@"resetAnimationKey"];
            if (animType && [animType isEqualToString:@"resetAnimationValue"]) {
                //回复动画完成
                self.userInteractionEnabled = YES;
                self.titleLab.hidden = NO;
                self.titleLab.text = @"完成";
            }
        }
    }
}

#pragma mark --<WGCircleAniViewDelegate>方法
-(void)aniDidStop:(CAAnimation *)ani finished:(BOOL)finished{
    
    if (finished) {
        //恢复动画
        [self resetAniDuation];
    }
}

//控制背景色和contentView一致
-(void)setBackgroundColor:(UIColor *)backgroundColor{
    
    self.firstColor = backgroundColor;
    self.contentView.backgroundColor = self.firstColor;
}

- (UIColor *)firstColor{
    if (!_firstColor) {
        _firstColor = UIColor.cyanColor;
    }
    return _firstColor;
}

-(void)setFirstColor:(UIColor *)firstColor{
    
    _firstColor = firstColor;
    self.contentView.backgroundColor = _firstColor;
}

- (CGFloat)firstDuation{
    if (_firstDuation <= 0) {
        _firstDuation = 3;
    }
    return _firstDuation;
}

- (UIColor *)secondColor{
    if (!_secondColor) {
        _secondColor = UIColor.redColor;
    }
    return _secondColor;
}

- (CGFloat)secondDuation{
    if (_secondDuation <= 0) {
        _secondDuation = 3;
    }
    return _secondDuation;
}

- (UIColor *)thirdColor{
    if (!_thirdColor) {
        _thirdColor = UIColor.cyanColor;
    }
    return _thirdColor;
}

- (CGFloat)thirdDuation{
    if (_thirdDuation <= 0) {
        _thirdDuation = 3;
    }
    return _thirdDuation;
}

@end
