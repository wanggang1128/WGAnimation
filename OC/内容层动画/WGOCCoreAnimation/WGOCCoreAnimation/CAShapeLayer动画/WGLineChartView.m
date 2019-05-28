//
//  WGLineChartView.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/27.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGLineChartView.h"

@interface WGLineChartView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation WGLineChartView

@synthesize lineColor = _lineColor;

-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.fillColor = UIColor.whiteColor.CGColor;
    _shapeLayer.strokeEnd = 0;
    _shapeLayer.lineWidth = 10;
    
    self.backgroundColor = UIColor.whiteColor;
    [self.layer addSublayer:_shapeLayer];
}

-(void)setPointArr:(NSArray *)pointArr{
    
    _pointArr = pointArr;
    if (pointArr.count == 0) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSValue *pointValue in pointArr) {
        
        CGPoint point = [pointValue CGPointValue];
        if ([pointValue isEqualToValue:pointArr[0]]) {
            
            [path moveToPoint:point];
        }else{
            [path addLineToPoint:point];
        }
    }
    
    _shapeLayer.path = path.CGPath;
    _shapeLayer.strokeColor = self.lineColor.CGColor;
}

- (void)startAni{
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = @"strokeEnd";
    ani.fromValue = @(0);
    ani.toValue = @(1);
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ani.duration = 3;
    ani.autoreverses = NO;
    [ani setRemovedOnCompletion:NO];
    
    _shapeLayer.strokeEnd = 1;
    [_shapeLayer addAnimation:ani forKey:nil];
}

-(UIColor *)lineColor{
    if (!_lineColor) {
        _lineColor = [UIColor redColor];
    }
    return _lineColor;
}

-(void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    _shapeLayer.strokeColor = _lineColor.CGColor;
}

@end
