//
//  ViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/17.
//  Copyright © 2018年 wanggang. All rights reserved.
//


#import "ViewController.h"
#import "WGClockViewController.h"
#import "WGLearnConceptViewController.h"
#import "WGTranslationViewController.h"
#import "WGSmileFaceViewController.h"
#import "WGHeartViewController.h"
#import "WGCAKeyframeAnimationViewController.h"
#import "WGMaskViewController.h"
#import "WGMenuViewController.h"
#import "WGBezierPathViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewController";
    [self buildView];
    [self loadData];
}

- (void)buildView{
    [self.view addSubview:self.tableView];
}

- (void)loadData{
    self.dataArr = @[@"实验一些概念", @"绘制时钟", @"创建平移/缩放/旋转动画", @"笑脸", @"心跳", @"关键帧动画", @"mask遮罩", @"扇形菜单", @"贝塞尔曲线"];
}

#pragma mark -<UITableViewDelegate, UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            WGLearnConceptViewController *vc = [[WGLearnConceptViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 1:{
            WGClockViewController *vc = [[WGClockViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 2:{
            WGTranslationViewController *vc = [[WGTranslationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 3:{
            WGSmileFaceViewController *vc = [[WGSmileFaceViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 4:{
            WGHeartViewController *vc = [[WGHeartViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 5:{
            WGCAKeyframeAnimationViewController *vc = [[WGCAKeyframeAnimationViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 6:{
            WGMaskViewController *vc = [[WGMaskViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 7:{
            WGMenuViewController *vc = [[WGMenuViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }case 8:{
            WGBezierPathViewController *vc = [[WGBezierPathViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark -懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WGWIDTH, WGHEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSArray alloc] init];
    }
    return _dataArr;
}











@end
