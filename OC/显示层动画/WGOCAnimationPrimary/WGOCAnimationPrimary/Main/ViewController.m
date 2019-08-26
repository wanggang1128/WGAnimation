//
//  ViewController.m
//  WGOCAnimationPrimary
//
//  Created by wanggang on 2019/5/21.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "ViewController.h"
#import "WGGeometryAniViewController.h"
#import "WGLocationAniViewController.h"
#import "WGAlphaAniViewController.h"
#import "WGCombinationViewController.h"
#import "WGZoomViewController.h"
#import "WGTurnPlateViewController.h"
#import "WGAirportViewController.h"
#import "WGTurnplateKeyViewController.h"
#import "WGPlaneViewController.h"


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"列表";
    
    self.dataArr = @[@"几何形状动画", @"位置形状动画", @"淡入淡出动画和颜色", @"综合位置&形状&颜色&渐变动画", @"旋转&缩放&平移", @"旋转实现-简单转盘", @"关键帧动画-飞机降落", @"关键帧动画-简单转盘", @"逐帧动画-飞机"];
    [self.view addSubview:self.tableView];
    
}

#pragma mark --<UITableViewDelegate, UITableViewDataSource>方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            
            WGGeometryAniViewController *vc = [[WGGeometryAniViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            
            WGLocationAniViewController *vc = [[WGLocationAniViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            
            WGAlphaAniViewController *vc = [[WGAlphaAniViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            
            WGCombinationViewController *vc = [[WGCombinationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            
            WGZoomViewController *vc = [[WGZoomViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:{
            
            WGTurnPlateViewController *vc = [[WGTurnPlateViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6:{
            
            WGAirportViewController *vc = [[WGAirportViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7:{
            
            WGTurnPlateViewController *vc = [[WGTurnPlateViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 8:{
            
            WGPlaneViewController *vc = [[WGPlaneViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:{
            
            break;
        }
    }
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, SCREEN_WIDTH, SCREEN_HEIGHT-Height_NavBar) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}


@end
