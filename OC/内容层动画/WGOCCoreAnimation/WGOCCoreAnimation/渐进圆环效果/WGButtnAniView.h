//
//  WGButtnAniView.h
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGButtnAniView : UIView

//标题视图
@property (nonatomic, strong) UILabel *titleLab;

//变圆期间颜色
@property (nonatomic, strong) UIColor *firstColor;
//变圆期间时间
@property (nonatomic, assign) CGFloat firstDuation;

//渐进圆进度颜色
@property (nonatomic, strong) UIColor *secondColor;
//渐进圆进度时间
@property (nonatomic, assign) CGFloat secondDuation;

//需要恢复的颜色
@property (nonatomic, strong) UIColor *thirdColor;
//恢复期间时间
@property (nonatomic, assign) CGFloat thirdDuation;

//开始动画入口
- (void)startAniDuation;

@end

NS_ASSUME_NONNULL_END
