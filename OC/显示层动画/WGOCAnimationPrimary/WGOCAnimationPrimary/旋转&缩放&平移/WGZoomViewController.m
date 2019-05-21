//
//  WGZoomViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGZoomViewController.h"

@interface WGZoomViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"旋转,缩放,平移";
    
    [self.view addSubview:self.btn];
    
    for (NSInteger i=1; i<4; i++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3*(i-1), Height_NavBar, SCREEN_WIDTH/3, 30)];
        NSString *title = nil;
        if (i==1) {
            title = @"旋转";
        }else if (i==2){
            title = @"缩放";
        }else{
            title = @"平移";
        }
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonClicked:(UIButton *)sender{

    [_btn removeFromSuperview];
    _btn = nil;
    [self.view addSubview:self.btn];
    
    if (sender.tag == 1) {
        //旋转
        [UIView animateWithDuration:3 animations:^{
            
            self.btn.transform = CGAffineTransformMakeRotation(M_PI);
        }];
    }else if (sender.tag == 2){
        //缩放
        [UIView animateWithDuration:3 animations:^{
            
            self.btn.transform = CGAffineTransformMakeScale(0.8, 1.2);
        }];
    }else{
        //平移
        [UIView animateWithDuration:3 animations:^{
            
            self.btn.transform = CGAffineTransformMakeTranslation(0, 100);
        }];
    }
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, SCREEN_WIDTH-20*2, 30)];
        [_btn setTitle:@"登录" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor cyanColor];
    }
    return _btn;
}

@end
