//
//  WGCircleView.m
//  WGAnimation
//
//  Created by wanggang on 2019/4/9.
//  Copyright © 2019 wanggang. All rights reserved.
//

#import "WGCircleView.h"

@implementation WGCircleView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.circleLayer = [WGCircleLayer layer];
        self.circleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:self.circleLayer];
    }
    return self;
}

@end
