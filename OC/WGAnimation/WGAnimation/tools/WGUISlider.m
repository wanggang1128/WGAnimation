//
//  WGUISlider.m
//  WGAnimation
//
//  Created by wanggang on 2019/4/10.
//  Copyright © 2019 wanggang. All rights reserved.
//

#define SLIDER_X_BOUND 30
#define SLIDER_Y_BOUND 40

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
        //如果不在slider范围类,适当扩充响应范围
        if ((point.x >= (_lastRect.origin.x - SLIDER_X_BOUND)) && (point.x <= (_lastRect.origin.x + _lastRect.size.width + SLIDER_X_BOUND))
            && (point.y >= -SLIDER_Y_BOUND) && (point.y < (_lastRect.size.height + SLIDER_Y_BOUND))) {
            //在扩充范围内,返回yes
            result = YES;
        }
    }
    //否则返回父类的结果
    return result;
}

@end
