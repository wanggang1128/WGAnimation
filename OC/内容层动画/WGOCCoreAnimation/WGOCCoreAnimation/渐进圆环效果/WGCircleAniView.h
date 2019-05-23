//
//  WGCircleAniView.h
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WGCircleAniViewDelegate <NSObject>

@optional
- (void)aniDidStop:(CAAnimation *)ani finished:(BOOL)finished;

@end

@interface WGCircleAniView : UIView

@property (nonatomic, weak) id<WGCircleAniViewDelegate> circleAniViewDelegate;

- (void)startCircleAniColor:(UIColor *)color duation:(CGFloat)duation;

@end

NS_ASSUME_NONNULL_END
