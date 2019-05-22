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

@property (nonatomic, strong) UILabel *titleLab;

- (void)startAniDuation:(NSTimeInterval)duation;

@end

NS_ASSUME_NONNULL_END
