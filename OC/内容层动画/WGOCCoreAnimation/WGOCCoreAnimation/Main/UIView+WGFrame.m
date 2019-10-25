//
//  UIView+WGFrame.m
//  CustomLearn
//
//  Created by wanggang on 2019/3/12.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UIView+WGFrame.h"

@implementation UIView (WGFrame)

- (CGSize)size;
{
    return [self frame].size;
}

- (void)setSize:(CGSize)size;
{
    CGPoint origin = [self frame].origin;
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

-(CGFloat)x{
    CGRect frame=[self frame];
    return frame.origin.x;
}

-(void)setX:(CGFloat)x{
    CGRect frame=[self frame];
    frame.origin.x=x;
    [self setFrame:frame];
}

-(CGFloat)y{
    CGRect frame=[self frame];
    return frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGRect frame=[self frame];
    frame.origin.y=y;
    return [self setFrame:frame];
}

- (CGFloat)left;
{
    return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x;
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)top;
{
    return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y;
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)right;
{
    return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = [self frame];
    frame.origin.x = right - frame.size.width;
    
    [self setFrame:frame];
}

- (CGFloat)bottom;
{
    return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom;
{
    CGRect frame = [self frame];
    frame.origin.y = bottom - frame.size.height;
    [self setFrame:frame];
}

- (CGFloat)centerX;
{
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX;
{
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY;
{
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY;
{
    [self setCenter:CGPointMake(self.center.x, centerY)];
}

- (CGFloat)width;
{
    return CGRectGetWidth([self frame]);
}

- (void)setWidth:(CGFloat)width;
{
    CGRect frame = [self frame];
    frame.size.width = width;
    [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)height;
{
    return CGRectGetHeight([self frame]);
}

- (void)setHeight:(CGFloat)height;
{
    CGRect frame=[self frame];
    frame.size.height = height;
    [self setFrame:CGRectStandardize(frame)];
}

@end
