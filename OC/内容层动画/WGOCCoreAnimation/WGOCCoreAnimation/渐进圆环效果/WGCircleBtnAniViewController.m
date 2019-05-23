//
//  WGCircleBtnAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGCircleBtnAniViewController.h"
#import "WGButtnAniView.h"


@interface WGCircleBtnAniViewController ()

@property (nonatomic, strong) WGButtnAniView *aniBtn;

@end

@implementation WGCircleBtnAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"渐进圆环效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.aniBtn = [[WGButtnAniView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, 200, 150, 70)];
    self.aniBtn.titleLab.text = @"下载";
    
    [self.view addSubview:self.aniBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod)];
    [self.aniBtn addGestureRecognizer:tap];
}

- (void)tapMethod{
    
    _aniBtn.firstColor = UIColor.brownColor;
    _aniBtn.secondColor = UIColor.redColor;
    _aniBtn.thirdColor = UIColor.greenColor;
    _aniBtn.firstDuation = 3;
    _aniBtn.secondDuation = 5;
    _aniBtn.thirdDuation = 1;
    
    [self.aniBtn startAniDuation];
    
}

@end
