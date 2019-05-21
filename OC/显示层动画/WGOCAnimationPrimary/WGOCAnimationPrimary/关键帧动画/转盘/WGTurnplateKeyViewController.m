//
//  WGTurnplateKeyViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGTurnplateKeyViewController.h"

@interface WGTurnplateKeyViewController ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation WGTurnplateKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"转盘";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, (SCREEN_HEIGHT-300)/2, 300, 300)];
    self.imgView.image = [UIImage imageNamed:@"turnPlate"];
    [self.view addSubview:self.imgView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            
            self.index += 1;
            self.imgView.transform = CGAffineTransformMakeRotation(M_PI_2*self.index);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            
            self.index += 1;
            self.imgView.transform = CGAffineTransformMakeRotation(M_PI_2*self.index);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            
            self.index += 1;
            self.imgView.transform = CGAffineTransformMakeRotation(M_PI_2*self.index);
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            
            self.index += 1;
            self.imgView.transform = CGAffineTransformMakeRotation(M_PI_2*self.index);
        }];
        
    } completion:nil];
}

@end
