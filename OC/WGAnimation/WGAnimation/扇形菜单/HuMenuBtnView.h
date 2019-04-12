//
//  HuMenuBtnView.h
//  317hu
//
//  Created by wanggang on 2018/8/14.
//  Copyright © 2018年 317护. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HuMenuBtn.h"

typedef void(^MenuBtnBlock)(NSInteger tag);

@interface HuMenuBtnView : UIView

+ (instancetype)HuMenuBtnViewShare;

@property (nonatomic, assign) CGPoint centerPoint;

//显示按钮
- (void)showMenu;
//隐藏
- (void)hidenMenu;
//无动画效果隐藏
- (void)hidenMenuWithoutAnimation;

@property (nonatomic, copy) MenuBtnBlock block;

@end
