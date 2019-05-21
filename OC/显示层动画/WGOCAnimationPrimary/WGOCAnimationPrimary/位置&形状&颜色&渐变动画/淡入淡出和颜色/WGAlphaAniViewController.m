//
//  WGAlphaAniViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGAlphaAniViewController.h"

@interface WGAlphaAniViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGAlphaAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"淡入淡出和颜色";
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-20*2, 30)];
    [_btn setTitle:@"登录" forState:UIControlStateNormal];
    [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor cyanColor];
    _btn.alpha = 0;
    [self.view addSubview:_btn];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:2 animations:^{
        
        self.btn.backgroundColor = UIColor.redColor;
        self.btn.alpha = 1;
    }];
}

@end
