//
//  WGUISlider.m
//  WGAnimation
//
//  Created by wanggang on 2019/4/10.
//  Copyright © 2019 wanggang. All rights reserved.
//

#import "WGUISlider.h"

@interface WGUISlider()

@property (nonatomic, assign) CGRect lastRect;

@end

@implementation WGUISlider

-(CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value{
    
    CGRect resultRect = [super thumbRectForBounds:bounds trackRect:rect value:value];
    self.lastRect = resultRect;
    return resultRect;
}

//检查是点击事件的点是否在slider范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //调用父类判断
    BOOL result = [super pointInside:point withEvent:event];
    
    if (!result) {
        
        result = CGRectContainsPoint(_lastRect, point);
    }
    return result;
}

@end
