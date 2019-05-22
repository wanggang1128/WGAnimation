//
//  WGWaterWaveBtn.h
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGWaterWaveBtn : UIButton

@property (nonatomic, assign) CGFloat viewRadius;
@property (nonatomic, assign) CGPoint touchPoint;
@property (nonatomic, strong) UIColor *aniColor;

- (void)startAniWithEvent:(UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
