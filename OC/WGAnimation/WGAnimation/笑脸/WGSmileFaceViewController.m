//
//  WGSmileFaceViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/20.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGSmileFaceViewController.h"

@interface WGSmileFaceViewController ()

@property (nonatomic, strong) UIView *yelloView;
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation WGSmileFaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGSmileFaceViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.titleLab];
    _titleLab.hidden = YES;
    [self.view addSubview:self.yelloView];
    [self.view addSubview:self.greenView];
    [self.view addSubview:self.redView];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:1 delay:0.5 usingSpringWithDamping:0.3 initialSpringVelocity:0.8 options:UIViewAnimationOptionTransitionNone animations:^{
        
        //改变黄色的中心点位置
        self.yelloView.center = CGPointMake(WGWIDTH - self.yelloView.centerX, self.yelloView.centerY + 30);
        
        //改变绿色的中心点位置
        self.greenView.center = CGPointMake(WGWIDTH - self.greenView.centerX, self.greenView.centerY + 30);
        
        //改变嘴巴的高度和中心点y的位置
        CGRect frame = CGRectMake(self.redView.x, self.redView.y, self.redView.width, 180);
        
        self.redView.frame = frame;
        
        //这句一定要加，不然看不到动画
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        //添加阻尼动画
        [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionTransitionNone animations:^{
            //把隐藏的标题文字设置为显示状态
            [self.titleLab setHidden:NO];
        } completion:nil];
        
    }];
}

#pragma mark -懒加载
-(UIView *)yelloView{
    if (!_yelloView) {
        _yelloView = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 100, 100)];
        _yelloView.backgroundColor = [UIColor yellowColor];
    }
    return _yelloView;
}
-(UIView *)greenView{
    if (!_greenView) {
        _greenView = [[UIView alloc] initWithFrame:CGRectMake(WGWIDTH-30-100, 200, 100, 100)];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
-(UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(self.view.centerX-100, 380, 200, 30)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(self.view.centerX-100, 100, 200, 30)];
        _titleLab.text = @"哈哈😝哈哈";
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

@end
