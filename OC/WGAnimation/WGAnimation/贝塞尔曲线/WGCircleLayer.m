//
//  WGCircleLayer.m
//  WGAnimation
//
//  Created by wanggang on 2019/4/9.
//  Copyright © 2019 wanggang. All rights reserved.
//

#define outsideRectSize 90


#import "WGCircleLayer.h"

typedef NS_ENUM(NSInteger, MovePoint){
    MovePoint_left,
    MovePoint_right
};

@interface WGCircleLayer()

//实时记录滑动方向
@property (nonatomic, assign) MovePoint movePoint;

//外接矩形
@property (nonatomic, assign) CGRect outSideRect;

@end

@implementation WGCircleLayer

-(instancetype)init{
    
    if (self = [super init]) {
        
    }
    return self;
}

-(id)initWithLayer:(WGCircleLayer *)layer{
    self = [super initWithLayer:layer];
    if (self) {
        self.progress    = layer.progress;
        self.outSideRect = layer.outSideRect;
    }
    return self;
}

-(void)setProgress:(CGFloat)progress{

    _progress = progress;

    //外接矩形在中心点的左侧,外接矩形的左侧坐标不变,右侧坐标改变;
    //外接矩形在中心点的右侧,外接矩形的右侧坐标不变,左侧坐标改变;
    if (progress <= 0.5) {
        self.movePoint = MovePoint_right;
    }else{
        self.movePoint = MovePoint_left;
    }

    CGFloat originX = self.position.x - outsideRectSize/2 + (progress - 0.5)*(self.frame.size.width - outsideRectSize);
    CGFloat originY = self.position.y - outsideRectSize/2;

    self.outSideRect = CGRectMake(originX, originY, outsideRectSize, outsideRectSize);

    [self setNeedsDisplay];
}

//
-(void)drawInContext:(CGContextRef)ctx{

    /*

                     外接矩形
                    + + A + +
                    +       +
                    D       B
                    +       +
                    + + C + +

     */

    //A-C1、B-C2... 的距离，当设置为正方形边长的1/3.6倍时，画出来的圆弧完美贴合圆形
    CGFloat offset = self.outSideRect.size.width/3.6;

    //A.B.C.D实际需要移动的距离.系数为滑块偏离中点0.5的绝对值再乘以2.当滑到两端的时候，movedDistance为最大值：「外接矩形宽度的1/6」.
    CGFloat moveDistance = (self.outSideRect.size.width/6)*fabs(self.progress-0.5)*2;

    //方便下方计算各点坐标，先算出外接矩形的中心点坐标
    CGPoint rectCenter = CGPointMake(self.outSideRect.origin.x+self.outSideRect.size.width/2, self.outSideRect.origin.y+self.outSideRect.size.height/2);

    CGPoint pointA = CGPointMake(rectCenter.x, self.outSideRect.origin.y+moveDistance);

    CGPoint pointB = CGPointMake(self.movePoint == MovePoint_left?rectCenter.x+self.outSideRect.size.width/2:rectCenter.x+self.outSideRect.size.width/2+moveDistance*2, rectCenter.y);

    CGPoint pointC = CGPointMake(rectCenter.x ,rectCenter.y + self.outSideRect.size.height/2 - moveDistance);

    CGPoint pointD = CGPointMake(self.movePoint == MovePoint_left?self.outSideRect.origin.x-moveDistance*2:self.outSideRect.origin.x, rectCenter.y);

    CGPoint c1 = CGPointMake(pointA.x+offset, pointA.y);
    CGPoint c2 = CGPointMake(pointB.x, self.movePoint == MovePoint_left?pointB.y-offset:pointB.y-offset+moveDistance);
    CGPoint c3 = CGPointMake(pointB.x, self.movePoint == MovePoint_left?pointB.y+offset:pointB.y+offset-moveDistance);
    CGPoint c4 = CGPointMake(pointC.x+offset, pointC.y);
    CGPoint c5 = CGPointMake(pointC.x-offset, pointC.y);
    CGPoint c6 = CGPointMake(pointD.x, self.movePoint == MovePoint_left?pointD.y+offset-moveDistance:pointD.y+offset);
    CGPoint c7 = CGPointMake(pointD.x, self.movePoint == MovePoint_left?pointD.y-offset+moveDistance:pointD.y-offset);
    CGPoint c8 = CGPointMake(pointA.x-offset, pointA.y);

    //外接矩形
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:self.outSideRect];
    CGContextAddPath(ctx, rectPath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1.0);
    CGFloat dash[] = {5.0, 5.0};
    // 1  虚线
    CGContextSetLineDash(ctx, 0.0, dash, 2);
    //给线条填充颜色
    CGContextStrokePath(ctx);

    //圆的边界
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath moveToPoint:pointA];
    [circlePath addCurveToPoint:pointB controlPoint1:c1 controlPoint2:c2];
    [circlePath addCurveToPoint:pointC controlPoint1:c3 controlPoint2:c4];
    [circlePath addCurveToPoint:pointD controlPoint1:c5 controlPoint2:c6];
    [circlePath addCurveToPoint:pointA controlPoint1:c7 controlPoint2:c8];
    [circlePath closePath];
    CGContextAddPath(ctx, circlePath.CGPath);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    // 2 实线
    CGContextSetLineDash(ctx, 0.0, NULL, 0);
    //同时给线条和线条包围的内部区域填充颜色
    CGContextDrawPath(ctx, kCGPathFillStroke);

}

@end
