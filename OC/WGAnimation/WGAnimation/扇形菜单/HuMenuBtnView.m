//
//  HuMenuBtnView.m
//  317hu
//
//  Created by wanggang on 2018/8/14.
//  Copyright © 2018年 317护. All rights reserved.
//

#import "HuMenuBtnView.h"

@interface HuMenuBtnView()

//视频
@property (nonatomic, strong) HuMenuBtn *menuBtn1;
//图片
@property (nonatomic, strong) HuMenuBtn *menuBtn2;
//文本
@property (nonatomic, strong) HuMenuBtn *menuBtn3;

@end

@implementation HuMenuBtnView

#pragma mark -单例
static HuMenuBtnView *instance;
+(instancetype)HuMenuBtnViewShare{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//显示按钮
-(void)showMenu{
    CGPoint center = self.centerPoint;
    CGFloat space = 50;
    
    CGPoint point1 = CGPointMake(center.x - space -self.menuBtn1.width/2, center.y+space/2);
    CGPoint point2 = CGPointMake(point1.x+20, center.y-space);
    CGPoint point3 = CGPointMake(center.x-10, point2.y-space);
    
    self.menuBtn1.tag = 1;
    self.menuBtn2.tag = 2;
    self.menuBtn3.tag = 3;
    
    _menuBtn1.alpha = 0;
    _menuBtn2.alpha = 0;
    _menuBtn3.alpha = 0;
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:_menuBtn1];
    [[[UIApplication sharedApplication] keyWindow] addSubview:_menuBtn2];
    [[[UIApplication sharedApplication] keyWindow] addSubview:_menuBtn3];
    
    [UIView animateWithDuration:0.2 animations:^{
        _menuBtn1.alpha = 1;
        _menuBtn2.alpha = 1;
        _menuBtn3.alpha = 1;
        _menuBtn1.center = point1;
        _menuBtn2.center = point2;
        _menuBtn3.center = point3;
    }];
}

//隐藏
-(void)hidenMenu{
    [UIView animateWithDuration:0.2 animations:^{
        _menuBtn1.center = self.centerPoint;
        _menuBtn2.center = self.centerPoint;
        _menuBtn3.center = self.centerPoint;
        _menuBtn1.alpha = 0;
        _menuBtn2.alpha = 0;
        _menuBtn3.alpha = 0;
    } completion:^(BOOL finished) {
        [_menuBtn1 removeFromSuperview];
        [_menuBtn2 removeFromSuperview];
        [_menuBtn3 removeFromSuperview];
    }];
}

//无动画隐藏
-(void)hidenMenuWithoutAnimation{
    [_menuBtn1 removeFromSuperview];
    [_menuBtn2 removeFromSuperview];
    [_menuBtn3 removeFromSuperview];
}

-(HuMenuBtn *)menuBtn1{
    if (!_menuBtn1) {
        _menuBtn1 = [HuMenuBtn btnWithTitle:nil imageName:@"vedioMenuBtn" center:_centerPoint];
        [_menuBtn1 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _menuBtn1;
}


- (void)menuBtnClicked:(UIButton *)sender{
    if (self.block) {
        self.block(sender.tag);
    }
}

-(HuMenuBtn *)menuBtn2{
    if (!_menuBtn2) {
        _menuBtn2 = [HuMenuBtn btnWithTitle:nil imageName:@"ImgMenuBtn" center:_centerPoint];
        [_menuBtn2 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _menuBtn2;
}

-(HuMenuBtn *)menuBtn3{
    if (!_menuBtn3) {
        _menuBtn3 = [HuMenuBtn btnWithTitle:nil imageName:@"textMenuBtn" center:_centerPoint];
        [_menuBtn3 addTarget:self action:@selector(menuBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _menuBtn3;
}





@end
