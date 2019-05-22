//
//  WGCALayerAnimationViewController.m
//  WGOCCoreAnimation
//
//  Created by wanggang on 2019/5/22.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGCALayerAnimationViewController.h"

@interface WGCALayerAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation WGCALayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CALayer层常用动画";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.dataArr = @[@"位置动画-position",@"位置动画-transform.translation.x",@"缩放动画-trainsform.scale",@"旋转动画-trainsform.rotation",@"颜色动画-backgroundColor",@"颜色动画-borderColor",@"淡入淡出动画-opacity",@"圆角动画-cornerRadius",@"边框动画-borderWidth",@"阴影动画-shadowOffset",@"关键帧动画-淡出", @"组合动画效果"];
    [self.view addSubview:self.tableView];
    [self btn];
}

//返回基础动画
- (CABasicAnimation *)aniKeyPath:(NSString *)keyPath fromValue:(id)fromVal toValue:(id)toVal duation:(CFTimeInterval)duation{
    
    CABasicAnimation *ani = [[CABasicAnimation alloc] init];
    ani.keyPath = keyPath;
    ani.fromValue = fromVal;
    ani.toValue = toVal;
    ani.duration = duation;
    ani.fillMode = kCAFillModeForwards;
    [ani setRemovedOnCompletion:NO];
    return ani;
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
            
            //位置动画-position
            [_btn removeFromSuperview];
            _btn = nil;
            CGFloat x = self.btn.centerX+self.btn.width/2;
            CGFloat y = self.btn.centerY+self.btn.height*4;
            //中心点
            NSValue *to = [NSValue valueWithCGPoint:CGPointMake(x, y)];
            CABasicAnimation *ani = [self aniKeyPath:@"position" fromValue:nil toValue:to duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 1:{
            
            //位置动画-transform.translation.y
            [_btn removeFromSuperview];
            _btn = nil;
            //移动距离
            CABasicAnimation *ani = [self aniKeyPath:@"transform.translation.x" fromValue:nil toValue:[NSNumber numberWithFloat:SCREEN_WIDTH/4] duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 2:{
            
            //缩放动画-transform.scale
            [_btn removeFromSuperview];
            _btn = nil;
            //缩放比例
            CABasicAnimation *ani = [self aniKeyPath:@"transform.scale" fromValue:nil toValue:@(1.5) duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 3:{
            
            //旋转动画-trainsform.rotation
            [_btn removeFromSuperview];
            _btn = nil;
            //旋转角度
            CABasicAnimation *ani = [self aniKeyPath:@"transform.rotation" fromValue:nil toValue:@(M_PI_2) duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 4:{
            
            //颜色动画-backgroundColor
            [_btn removeFromSuperview];
            _btn = nil;
            //背景色渐变
            CABasicAnimation *ani = [self aniKeyPath:@"backgroundColor" fromValue:nil toValue:(id)[UIColor greenColor].CGColor duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 5:{
            
            //颜色动画-borderColor
            [_btn removeFromSuperview];
            _btn = nil;
            self.btn.layer.borderWidth = 5;
            //边框颜色渐变
            CABasicAnimation *ani = [self aniKeyPath:@"borderColor" fromValue:(id)[UIColor redColor].CGColor toValue:(id)[UIColor greenColor].CGColor duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 6:{
            
            //淡入淡出动画-opacity
            [_btn removeFromSuperview];
            _btn = nil;
            CABasicAnimation *ani = [self aniKeyPath:@"opacity" fromValue:nil toValue:@(0) duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 7:{
            
            //圆角动画-cornerRadius
            [_btn removeFromSuperview];
            _btn = nil;
            //圆角
            CABasicAnimation *ani = [self aniKeyPath:@"cornerRadius" fromValue:@(0) toValue:@(self.btn.height/2) duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 8:{
            
            //边框动画-borderWidth
            [_btn removeFromSuperview];
            _btn = nil;
            CABasicAnimation *ani = [self aniKeyPath:@"borderWidth" fromValue:@(0) toValue:@(5) duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 9:{
            
            //阴影动画-shadowOffset
            [_btn removeFromSuperview];
            _btn = nil;
            self.btn.layer.shadowColor = UIColor.greenColor.CGColor;
            _btn.layer.shadowOpacity = 0.5;
            NSValue *to = [NSValue valueWithCGSize:CGSizeMake(-10, 10)];
            CABasicAnimation *ani = [self aniKeyPath:@"shadowOffset" fromValue:nil toValue:to duation:3];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 10:{
            
            //"关键帧动画-淡出"
            [_btn removeFromSuperview];
            _btn = nil;
            CAKeyframeAnimation *ani = [[CAKeyframeAnimation alloc] init];
            ani.keyPath = @"opacity";
            ani.values = @[
                           [NSNumber numberWithFloat:0.9],
                           [NSNumber numberWithFloat:0.8],
                           [NSNumber numberWithFloat:0.7],
                           [NSNumber numberWithFloat:0.6],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.4],
                           [NSNumber numberWithFloat:0.3],
                           [NSNumber numberWithFloat:0.2],
                           [NSNumber numberWithFloat:0.1],
                           [NSNumber numberWithFloat:0]
                           ];
            ani.duration = 3;
            ani.fillMode = kCAFillModeForwards;
            [ani setRemovedOnCompletion:NO];
            [self.btn.layer addAnimation:ani forKey:nil];
            break;
        }
        case 11:{
            
            //"组合动画效果"
            [_btn removeFromSuperview];
            _btn = nil;
            CABasicAnimation *ani01 = [self aniKeyPath:@"transform.scale" fromValue:nil toValue:@(0) duation:3];
            CABasicAnimation *ani02 = [self aniKeyPath:@"transform.rotation" fromValue:nil toValue:@(M_PI_2) duation:3];
            CABasicAnimation *ani03 = [self aniKeyPath:@"transform.translation" fromValue:nil toValue:@(CGPointMake(200, -200)) duation:3];
            CAAnimationGroup *aniGroup = [[CAAnimationGroup alloc] init];
            aniGroup.animations = @[ani01, ani02, ani03];
            aniGroup.duration = 3;
            aniGroup.fillMode = kCAFillModeForwards;
            [aniGroup setRemovedOnCompletion:NO];
            [self.btn.layer addAnimation:aniGroup forKey:nil];
            break;
        }
        default:
            break;
    }
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/4*3, SCREEN_WIDTH/2, 30)];
        _btn.backgroundColor = UIColor.redColor;
        [_btn setTitle:@"登录" forState:UIControlStateNormal];
        [_btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [self.view addSubview:self.btn];
    }
    return _btn;
}


@end
