//
//  WGTurnPlateViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGTurnPlateViewController.h"

@interface WGTurnPlateViewController ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) BOOL finished;

@end

@implementation WGTurnPlateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"简单转盘";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, (SCREEN_HEIGHT-300)/2, 300, 300)];
    self.imgView.image = [UIImage imageNamed:@"turnPlate"];
    [self.view addSubview:self.imgView];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    self.imgView.transform = CGAffineTransformMakeRotation(M_PI_2);
    [UIView setAnimationDidStopSelector:@selector(animationStop)];
    [UIView commitAnimations];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.finished = YES;
}

- (void)animationStop{
    
    if (!_finished) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        self.index += 1;
        CGFloat angle = M_PI_2*self.index;
        self.imgView.transform = CGAffineTransformMakeRotation(angle);
        [UIView setAnimationDidStopSelector:@selector(animationStop)];
        [UIView commitAnimations];
    }
}

@end
