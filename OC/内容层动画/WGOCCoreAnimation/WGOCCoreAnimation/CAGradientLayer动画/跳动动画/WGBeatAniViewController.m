//
//  WGBeatAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/27.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGBeatAniViewController.h"

@interface WGBeatAniViewController ()

@property (nonatomic, strong) NSArray *colorArr;
@property (nonatomic, strong) NSMutableArray *layerArr;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WGBeatAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"跳动动画";
    self.view.backgroundColor = [UIColor blackColor];
    
    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(colorChage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)colorChage{
    
    for (CAGradientLayer *layer in self.layerArr) {
        
        NSInteger index = arc4random_uniform(11);
        UIColor *color = self.colorArr[index];
        NSArray *arr = @[(id)UIColor.clearColor.CGColor, (id)color.CGColor];
        
        layer.colors = arr;
        layer.locations = @[@(0.0), @(1)];
        
        CABasicAnimation *ani = [[CABasicAnimation alloc] init];
        ani.keyPath = @"locations";
        CGFloat beginValue = arc4random_uniform(11)/10.0;
        ani.fromValue = @[@(beginValue), @(beginValue)];
        ani.toValue = @[@(1), @(1)];
        ani.duration = 0.5;
        [layer addAnimation:ani forKey:nil];
    }
}

- (NSArray *)colorArr{
    if (!_colorArr) {
        UIColor *color01 = UIColor.blackColor;
        UIColor *color02 = UIColor.blueColor;
        UIColor *color03 = UIColor.brownColor;
        UIColor *color04 = UIColor.cyanColor;
        UIColor *color05 = UIColor.grayColor;
        UIColor *color06 = UIColor.greenColor;
        UIColor *color07 = UIColor.magentaColor;
        UIColor *color08 = UIColor.orangeColor;
        UIColor *color09 = UIColor.purpleColor;
        UIColor *color010 = UIColor.redColor;
        UIColor *color011 = UIColor.yellowColor;
        _colorArr = @[color01, color02, color03, color04, color05, color06, color07, color08, color09, color010, color011];
    }
    return _colorArr;
}

- (NSMutableArray *)layerArr{
    if (!_layerArr) {
        
        _layerArr = [[NSMutableArray alloc] init];

        for (NSInteger i = 0; i< 15; i++) {
            
            CAGradientLayer *layer = [[CAGradientLayer alloc] init];
            
            CGFloat w = (SCREEN_WIDTH-10)/15;
            CGFloat h = 150;
            
            CGFloat x = 20;
            CGFloat y = 150;
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(w*i+x, y, w-x, h)];
            [self.view addSubview:view];
            
            layer.frame = view.bounds;
            layer.startPoint = CGPointMake(0, 0);
            layer.endPoint = CGPointMake(0, 1);
            
            [view.layer addSublayer:layer];
            [_layerArr addObject:layer];
        }
    }
    return _layerArr;
}


@end
