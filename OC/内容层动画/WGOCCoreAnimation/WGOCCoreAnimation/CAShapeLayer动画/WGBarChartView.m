//
//  WGBarChartView.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/27.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGBarChartView.h"

@interface WGBarChartView()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation WGBarChartView

@synthesize lineColor = _lineColor;

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    
    self.backgroundColor = UIColor.whiteColor;
    
    self.shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.fillColor = UIColor.whiteColor.CGColor;
    _shapeLayer.lineWidth = 20;
    _shapeLayer.strokeEnd = 0;
    [self.layer addSublayer:_shapeLayer];
}

-(void)setPointArr:(NSArray *)pointArr{
    
    _pointArr = pointArr;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSArray *arr in pointArr) {
        
        for (NSValue *pointValue in arr) {
            
            CGPoint point = [pointValue CGPointValue];
            
            if ([pointValue isEqualToValue:arr[0]]) {
                
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];
            }
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
    [ani setRemovedOnCompletion:NO];
    ani.duration = 3;
    
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
