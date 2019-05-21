//
//  WGCombinationViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGCombinationViewController.h"

@interface WGCombinationViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGCombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"综合位置&形状&颜色&渐变动画";
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(-200, 400, SCREEN_WIDTH-20*2, 30)];
    [_btn setTitle:@"点我" forState:UIControlStateNormal];
    [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor cyanColor];
    _btn.alpha = 0;
    [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:2 animations:^{
        
        self.btn.alpha = 1;
        self.btn.frame = CGRectMake(20, 400, self.btn.width, self.btn.height);
    }];
}

- (void)btnClicked{
    
    [UIView animateWithDuration:3 animations:^{
        
        self.btn.alpha = 0;
        self.btn.transform = CGAffineTransformMakeRotation(M_PI);
        self.btn.frame = CGRectMake(SCREEN_WIDTH, 0, 0, 0);
        self.btn.alpha = 0;
        self.btn.backgroundColor = UIColor.yellowColor;
    }];
}

@end
