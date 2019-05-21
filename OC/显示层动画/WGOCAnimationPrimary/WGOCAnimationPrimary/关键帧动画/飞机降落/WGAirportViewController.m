//
//  WGAirportViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGAirportViewController.h"

@interface WGAirportViewController ()

@property (nonatomic, strong) UIImageView *airPortImgView;
@property (nonatomic, strong) UIImageView *planeImgView;

@end

@implementation WGAirportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"飞机降落";
    
    self.airPortImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _airPortImgView.image = [UIImage imageNamed:@"airport"];
    _airPortImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_airPortImgView];
    
    self.planeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    _planeImgView.image = [UIImage imageNamed:@"plane"];
    _planeImgView.contentMode = UIViewContentModeScaleAspectFit;
    [_airPortImgView addSubview:_planeImgView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{

        /*
         startTime：关键帧开始时间，该时间是相对整个关键帧动画持续时间的相对时间，一般值在0到1之间。如果为0，则表明这一关键帧从整个动画的第0秒开始执行，如果设为0.5，则表明从整个动画的中间开始执行。
         relativeDuration：关键帧持续时间，该时间同样是相对整个关键帧动画持续时间的相对时间，一般值也在0到1之间。如果设为0.5，则表明这一关键帧的持续时间为整个动画持续时间的二分之一。
         */
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{

            self.planeImgView.frame = CGRectMake(300, 100, 30, 30);
        }];

        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{

            self.planeImgView.frame = CGRectMake(300, 300, 80, 80);
        }];

    } completion:^(BOOL finished) {

    }];
}

@end
