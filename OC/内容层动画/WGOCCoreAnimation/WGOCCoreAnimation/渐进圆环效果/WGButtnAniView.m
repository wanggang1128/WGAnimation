//
//  WGButtnAniView.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGButtnAniView.h"

@interface WGButtnAniView()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation WGButtnAniView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self buildBaseView];
    }
    return self;
}

- (void)buildBaseView{
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _contentView.backgroundColor = [UIColor cyanColor];
    [self addSubview:_contentView];
    
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

- (void)startAniDuation:(NSTimeInterval)duation{
    
    self.titleLab.hidden = YES;
    self.userInteractionEnabled = NO;
    
    //调整大小
    NSValue *to = [NSValue valueWithCGRect:CGRectMake(self.x+(self.width-self.height)/2, self.height, self.height, self.height)];
    CABasicAnimation *boundsAni = [self aniKeyPath:@"bounds" fromValue:nil toValue:to];
    
    //背景色渐变透明
    CABasicAnimation *backgroundColorAni = [self aniKeyPath:@"backgroundColor" fromValue:nil toValue:(id)[UIColor clearColor].CGColor];
    
    //变圆
    CABasicAnimation *circleAni = [self aniKeyPath:@"cornerRadius" fromValue:@(0) toValue:@(self.height/2)];
    
    //边框宽度
    CABasicAnimation *borderWidthAni = [self aniKeyPath:@"borderWidth" fromValue:@(0) toValue:@(5)];
    
    //边框颜色
    CABasicAnimation *borderColorAni = [self aniKeyPath:@"borderColor" fromValue:(id)[UIColor cyanColor].CGColor toValue:(id)[UIColor grayColor].CGColor];
    
    //动画组
    CAAnimationGroup *contentGroup = [[CAAnimationGroup alloc] init];
    contentGroup.animations = @[boundsAni, backgroundColorAni, circleAni, borderColorAni, borderWidthAni];
    contentGroup.duration = 3;
    contentGroup.fillMode = kCAFillModeForwards;
    [contentGroup setRemovedOnCompletion:NO];
    contentGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [contentGroup setValue:@"startAnimationValue" forKey:@"startAnimationKey"];
    
    [self.contentView.layer addAnimation:contentGroup forKey:@"startAnimationValue"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (flag) {
        
        NSString *animType = [anim valueForKey:@"startAnimationKey"];
        if (animType && [animType isEqualToString:@"startAnimationValue"]) {
            //开始进度动画
        }
    }
}

@end
