//
//  WGMenuViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/9/3.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGMenuViewController.h"
#import "HuMenuBtnView.h"

@interface WGMenuViewController ()
{
    BOOL _ISShowMenuButton;
}
@property (nonatomic, strong) UIButton *button ;
@property (nonatomic, strong) HuMenuBtnView *menuView;

@end

@implementation WGMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WGMenuViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    _ISShowMenuButton = NO;
    [_button setBackgroundImage:[UIImage imageNamed:@"addMenuBtn"] forState:UIControlStateNormal];
    [self.menuView hidenMenu];
}

- (void)buildView{
    _ISShowMenuButton = NO;
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(WGWIDTH-100, WGHEIGHT-120, 80, 80)];
    _button.layer.cornerRadius = 40;
    [_button addTarget:self action:@selector(clickAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [_button setBackgroundImage:[UIImage imageNamed:@"addMenuBtn"] forState:UIControlStateNormal];
    [self.view addSubview:_button];
    
    _menuView = [HuMenuBtnView HuMenuBtnViewShare];
    _menuView.centerPoint = _button.center;
    __weak typeof(self) weakSelf = self;
    _menuView.block = ^(NSInteger tag) {
        _ISShowMenuButton = YES;
        [weakSelf clickAddButton:weakSelf.button];
        switch (tag) {
            case 1:{
                //视频
                NSLog(@"视频");
                break;
            }
            case 2:{
                //图片
                NSLog(@"图片");
                break;
            }
            case 3:{
                //文本
                NSLog(@"文字");
                break;
            }
            default:
                break;
        }
    };
}

- (void)clickAddButton:(UIButton *)sender{
    
    if (!_ISShowMenuButton) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"foldMenuBtn"] forState:UIControlStateNormal];
        [_menuView showMenu];
    }else{
        
        [sender setBackgroundImage:[UIImage imageNamed:@"addMenuBtn"] forState:UIControlStateNormal];
        [_menuView hidenMenu];
    }
    _ISShowMenuButton = !_ISShowMenuButton;
}








@end
