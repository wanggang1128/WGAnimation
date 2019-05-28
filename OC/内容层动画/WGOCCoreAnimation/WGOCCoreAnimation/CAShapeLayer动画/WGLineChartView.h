//
//  WGLineChartView.h
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/27.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGLineChartView : UIView

//每个数据位置
@property (nonatomic, strong)  NSArray *pointArr;
//折线颜色
@property (nonatomic, strong) UIColor *lineColor;

//开始
- (void)startAni;

@end

NS_ASSUME_NONNULL_END
