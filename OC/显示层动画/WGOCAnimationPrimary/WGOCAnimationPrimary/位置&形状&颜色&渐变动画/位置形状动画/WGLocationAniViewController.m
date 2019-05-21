//
//  WGLocationAniViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGLocationAniViewController.h"

@interface WGLocationAniViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGLocationAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"位置形状动画";
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-20*2, 30)];
    [_btn setTitle:@"登录" forState:UIControlStateNormal];
    [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_btn];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:2 animations:^{
        
        self.btn.frame = CGRectMake(20, 300, self.btn.width, self.btn.height);
    }];
}

@end
