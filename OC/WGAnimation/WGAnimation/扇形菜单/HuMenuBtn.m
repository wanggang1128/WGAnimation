//
//  HuMenuBtn.m
//  317hu
//
//  Created by wanggang on 2018/8/14.
//  Copyright © 2018年 317护. All rights reserved.
//

#import "HuMenuBtn.h"

@implementation HuMenuBtn

+ (instancetype)btnWithTitle:(NSString *)titleStr imageName:(NSString *)imgStr center:(CGPoint)center{
    
    CGRect frame = CGRectMake(0, 0, 80, 80);
    HuMenuBtn *menuBtn = [[HuMenuBtn alloc] initWithFrame:frame];
    menuBtn.center = center;
    menuBtn.layer.cornerRadius = 80/2.0;
    /*
     目前没有这种需求
     [menuBtn setTitle:title forState:UIControlStateNormal];
     [menuBtn setImage:[UIImage imageNamed:imageTitle] forState:UIControlStateNormal];
     */
    [menuBtn setBackgroundImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
    return menuBtn;
}

/*
 下面的两个函数可以设置图片,目前需求不需要
 - (CGRect)imageRectForContentRect:(CGRect)contentRect
 {
 return CGRectMake(0, 0, 50, 50);
 }
 
 - (void)setImage:(UIImage *)image forState:(UIControlState)state{
 [super setImage:image forState:state];
 }
 
 */


/*
 下面的两个函数可以设置文字,目前需求不需要
 - (CGRect)titleRectForContentRect:(CGRect)contentRect
 {
 return CGRectMake(0,26, self.bounds.size.width, 20);
 }
 
 - (void)setTitle:(NSString *)title forState:(UIControlState)state{
 [super setTitle:title forState:state];
 self.titleLabel.font = [UIFont systemFontOfSize:12];
 self.titleLabel.textAlignment = NSTextAlignmentCenter;
 [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 }
 */

@end
