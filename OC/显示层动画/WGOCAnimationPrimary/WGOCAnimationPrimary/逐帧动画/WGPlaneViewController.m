//
//  WGPlaneViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGPlaneViewController.h"

@interface WGPlaneViewController ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, assign) NSInteger index;

@end

@implementation WGPlaneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"飞机";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.imgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imgView];
    [self aniMethod02];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.link invalidate];
}

- (void)aniMethod01{
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImage)];
    _link.preferredFramesPerSecond = 30;
    [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)aniMethod02{
    
    NSMutableArray *imgArr = [[NSMutableArray alloc] init];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        for (NSInteger i=0; i<66; i++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", i]];
            [imgArr addObject:img];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imgView.animationImages = imgArr;
            self.imgView.animationDuration = 5;
            self.imgView.animationRepeatCount = MAXFLOAT;
            [self.imgView startAnimating];
        });
    });
}

- (void)changeImage{
    
    NSString *imgName = [NSString stringWithFormat:@"%ld.png", self.index];
    self.imgView.image = [UIImage imageNamed:imgName];
    
    self.index ++;
    if (self.index == 67) {
        self.index = 0;
        NSString *imgName = [NSString stringWithFormat:@"%ld.png", self.index];
        self.imgView.image = [UIImage imageNamed:imgName];
    }
}

@end
