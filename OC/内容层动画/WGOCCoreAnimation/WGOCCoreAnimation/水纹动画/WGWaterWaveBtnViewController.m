//
//  WGWaterWaveBtnViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGWaterWaveBtnViewController.h"
#import "WGWaterWaveBtn.h"

@interface WGWaterWaveBtnViewController ()

@property (nonatomic, strong) WGWaterWaveBtn *btn;

@end

@implementation WGWaterWaveBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[WGWaterWaveBtn alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT/2, SCREEN_WIDTH-40, 70)];
    _btn.backgroundColor = UIColor.redColor;
    [_btn setTitle:@"点我" forState:UIControlStateNormal];
    [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClicked: event:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

- (void)btnClicked:(UIButton *)sender event:(UIEvent *)event{
    
    [self.btn startAniWithEvent:event];
}

@end
