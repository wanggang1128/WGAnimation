//
//  WGEarthAniViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/29.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGEarthAniViewController.h"

@interface WGEarthAniViewController ()

@end

@implementation WGEarthAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地球公转";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *earthImgView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+150, (SCREEN_HEIGHT-50)/2, 50, 50)];
    earthImgView.image = [UIImage imageNamed:@"earth"];
    
    UIImageView *sunImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    sunImgView.center = self.view.center;
    sunImgView.image = [UIImage imageNamed:@"sun"];
    
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    [layer addSublayer:earthImgView.layer];
    [layer addSublayer:sunImgView.layer];
    layer.instanceCount = 3;
    layer.instanceDelay = 1;
    
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.view.center radius:150 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    [path closePath];
    
    CAKeyframeAnimation *ani = [[CAKeyframeAnimation alloc] init];
    ani.keyPath = @"position";
    ani.path = path.CGPath;
    ani.duration = 10;
    ani.repeatCount = MAXFLOAT;
    
    [earthImgView.layer addAnimation:ani forKey:nil];
    
}



@end
