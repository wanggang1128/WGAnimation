//
//  WGCircleAniView.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGCircleAniView.h"

@interface WGCircleAniView()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation WGCircleAniView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self buildBaseView];
    }
    return self;
}

- (void)buildBaseView{
    
    self.shapeLayer = [[CAShapeLayer alloc] init];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:self.center radius:self.height/2-2.5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    _shapeLayer.path = circlePath.CGPath;
    _shapeLayer.lineWidth = 5;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:_shapeLayer];
}

- (void)startCircleAniColor:(UIColor *)color duation:(CGFloat)duation;{
    
    self.hidden = NO;
    self.shapeLayer.strokeColor = color.CGColor;
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = @"strokeEnd";
    ani.duration = duation;
    ani.fromValue = @(0);
    ani.toValue = @(1);
    ani.delegate = self;
    ani.fillMode = kCAFillModeForwards;
    [ani setRemovedOnCompletion:NO];
    [self.shapeLayer addAnimation:ani forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    if (flag) {
        //进度动画完成,回调
        if (self.circleAniViewDelegate && [self.circleAniViewDelegate respondsToSelector:@selector(aniDidStop:finished:)]) {
            
            self.hidden = YES;
            [self.circleAniViewDelegate aniDidStop:anim finished:flag];
        }
    }
}

@end
