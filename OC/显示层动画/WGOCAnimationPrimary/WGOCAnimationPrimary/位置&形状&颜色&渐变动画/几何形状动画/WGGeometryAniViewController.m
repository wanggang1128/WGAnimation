//
//  WGGeometryAniViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGGeometryAniViewController.h"

@interface WGGeometryAniViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGGeometryAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"集合形状动画";
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-20*2, 30)];
    [_btn setTitle:@"登录" forState:UIControlStateNormal];
    [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_btn];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:2 animations:^{
        
        self.btn.bounds = CGRectMake(0, 0, self.btn.width*0.8, self.btn.height*1.2);
    }];
}

@end
