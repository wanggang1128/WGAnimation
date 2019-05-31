//
//  WGCoverFlowViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/31.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGCoverFlowViewController.h"

@interface WGCoverFlowViewController ()

@property (nonatomic, strong) NSArray *imgArr;

@end

@implementation WGCoverFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CoverFlow效果";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img01 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 250)];
    img01.image = [UIImage imageNamed:@"0.jpg"];
    CGPoint point = img01.layer.anchorPoint;
    point.y = 0;
    img01.layer.anchorPoint = point;
    [self.view addSubview:img01];
    
    UIImageView *img02 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 200, 250)];
    img02.image = [UIImage imageNamed:@"1.jpg"];
    point = img02.layer.anchorPoint;
    point.y = 0;
    img02.layer.anchorPoint = point;
    [self.view addSubview:img02];
    
    UIImageView *img03 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 300, 200)];
    img03.image = [UIImage imageNamed:@"2.jpg"];
    point = img03.layer.anchorPoint;
    point.y = 0;
    img03.layer.anchorPoint = point;
    [self.view addSubview:img03];
    
    self.imgArr = @[img01, img02, img03];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    for (NSInteger i = 0; i < self.imgArr.count; i++) {
        
        CATransform3D imgTransform = CATransform3DIdentity;
        imgTransform.m34 = -0.005;
        imgTransform = CATransform3DTranslate(imgTransform, 0, 50, 0);
        imgTransform = CATransform3DScale(imgTransform, 0.95, 0.6, 1);
        if (i == 0) {
            imgTransform = CATransform3DRotate(imgTransform, M_PI/8, 0, 1, 0);
        }else if (i == 1){
            imgTransform = CATransform3DRotate(imgTransform, -M_PI/8, 0, 1, 0);
        }
        
        UIImageView *imgView = self.imgArr[i];
        
        CABasicAnimation *transformAni = [CABasicAnimation animation];
        transformAni.keyPath = @"transform";
        transformAni.fromValue = [NSValue valueWithCATransform3D:imgView.layer.transform];
        transformAni.toValue = [NSValue valueWithCATransform3D:imgTransform];
        
        CABasicAnimation *positionAni = [CABasicAnimation animation];
        positionAni.keyPath = @"position";
        if (i == 0) {
            
            positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 30)];
        }else if (i == 1){
            
            positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 30)];
        }else{
            
            positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 40)];
        }
        
        CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
        group.animations = @[transformAni, positionAni];
        group.duration = 6;
        [group setRemovedOnCompletion:NO];
        group.repeatCount = 1;
        group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        group.fillMode = kCAFillModeForwards;
        
        [imgView.layer addAnimation:group forKey:nil];
    }
}

@end
