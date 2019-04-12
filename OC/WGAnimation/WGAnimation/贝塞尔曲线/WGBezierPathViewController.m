//
//  WGBezierPathViewController.m
//  WGAnimation
//
//  Created by wanggang on 2019/4/9.
//  Copyright © 2019 wanggang. All rights reserved.
//

#import "WGBezierPathViewController.h"
#import "WGCircleView.h"
#import "WGUISlider.h"

@interface WGBezierPathViewController ()

@property (nonatomic, strong) WGUISlider *slideView;
@property (nonatomic, strong) UILabel *curValueLab;
@property (nonatomic, strong) WGCircleView *circleView;

@end

@implementation WGBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"贝塞尔曲线";
    [self.view addSubview:self.slideView];
    [self.view addSubview:self.curValueLab];

    self.circleView = [[WGCircleView alloc] initWithFrame:CGRectMake((WGWIDTH - 320)/2, (WGHEIGHT - 320-90)/2, 320, 320)];
    _circleView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.circleView];
    _circleView.circleLayer.progress = self.slideView.value;
}



- (void)slideViewChange:(UISlider *)sender{
    
    self.curValueLab.text = [NSString stringWithFormat:@"当前进度:%.2f",sender.value];
    _circleView.circleLayer.progress = sender.value;

}

- (WGUISlider *)slideView{
    
    if (!_slideView) {
        _slideView = [[WGUISlider alloc] initWithFrame:CGRectMake(WGWIDTH/3/2, WGHEIGHT-50, WGWIDTH*2/3, 5)];
        [_slideView addTarget:self action:@selector(slideViewChange:) forControlEvents:UIControlEventValueChanged];
        _slideView.minimumValue = 0;
        _slideView.maximumValue = 1;
        _slideView.value = 0.5;
        _slideView.thumbTintColor = [UIColor cyanColor];
    }
    return _slideView;
}

- (UILabel *)curValueLab{
    
    if (!_curValueLab) {
        _curValueLab = [[UILabel alloc] initWithFrame:CGRectMake(WGWIDTH/3/2, WGHEIGHT-50-40, WGWIDTH*2/3, 20)];
        _curValueLab.textAlignment = NSTextAlignmentCenter;
        _curValueLab.textColor = [UIColor blackColor];
        _curValueLab.text = [NSString stringWithFormat:@"当前进度:%.2f",_slideView.value];
    }
    return _curValueLab;
}

@end
