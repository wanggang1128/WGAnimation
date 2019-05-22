//
//  WGWaterWaveBtn.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGWaterWaveBtn.h"

@interface WGWaterWaveBtn()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WGWaterWaveBtn


- (void)startAniWithEvent:(UIEvent *)event{
    
    self.userInteractionEnabled = NO;
    NSSet *touchSet = [event touchesForView:self];
    NSArray *touchArr = touchSet.allObjects;
    UITouch *touch = touchArr.firstObject;
    CGPoint point = [touch locationInView:self];
    self.touchPoint = point;
    
    self.timer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)timerMethod{
    
    self.viewRadius += 5;
    [self setNeedsDisplay];
    
    if (self.viewRadius >= self.width) {
        [self.timer invalidate];
        self.timer = nil;
        self.viewRadius = 0;
        [self setNeedsDisplay];
        self.userInteractionEnabled = YES;
    }
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, self.touchPoint.x, self.touchPoint.y, self.viewRadius, 0, M_PI*2, NO);
    [self.aniColor setStroke];
    [self.aniColor setFill];
    CGContextFillPath(context);
}

-(UIColor *)aniColor{
    if (!_aniColor) {
        _aniColor = [UIColor cyanColor];
    }
    return _aniColor;
}

@end
