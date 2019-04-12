//
//  WGClockViewController.m
//  WGAnimation
//
//  Created by wanggang on 2018/8/17.
//  Copyright © 2018年 wanggang. All rights reserved.
//

#import "WGClockViewController.h"

@interface WGClockViewController ()

//钟盘
@property (nonatomic, strong) CALayer *clockLayer;
//时针
@property (nonatomic, strong) UIView *hourView;
//分针
@property (nonatomic, strong) UIView *minuteView;
//秒针
@property (nonatomic, strong) UIView *secondView;

//计时器
@property (nonatomic, strong) CADisplayLink *link;

//动态添加类
@property (nonatomic, strong) NSObject *target;

@end

const void *key = @"key";

@implementation WGClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self buildClockLayer];
    [self buildTimeView];
    [self buildTimer];
}

- (void)buildView{
    self.title = @"WGClockViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)buildClockLayer{
    self.clockLayer = [[CALayer alloc] init];
    
    _clockLayer.bounds = CGRectMake(0, 0, 150, 150);
    
    _clockLayer.position = self.view.center;
    
    _clockLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock.png"].CGImage);
    
    [self.view.layer addSublayer:_clockLayer];
}

- (void)buildTimeView{
    
    //设置秒针
    self.secondView = [[UIView alloc] init];
    _secondView.bounds = CGRectMake(0, 0, 1, 60);
    _secondView.center = self.view.center;
    _secondView.backgroundColor = [UIColor redColor];
    //修改锚点
    _secondView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:_secondView];
    
    //设置分针
    self.minuteView = [[UIView alloc] init];
    _minuteView.bounds = CGRectMake(0, 0, 1, 50);
    _minuteView.center = self.view.center;
    _minuteView.backgroundColor = [UIColor brownColor];
    //修改锚点
    _minuteView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:_minuteView];
    
    //设置时针
    self.hourView = [[UIView alloc] init];
    _hourView.bounds = CGRectMake(0, 0, 1, 40);
    _hourView.center = self.view.center;
    _hourView.backgroundColor = [UIColor blackColor];
    //修改锚点
    _hourView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:_hourView];
}

- (void)buildTimer{
    
    //动态创建类
    self.target = [[NSObject alloc] init];
    //给类添加方法
    class_addMethod([_target class], @selector(clockRunning), (IMP)clockMethod, "v@:");
    
    self.link = [CADisplayLink displayLinkWithTarget:self.target selector:@selector(clockRunning)];
    //添加到runloop中
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    //关联属性
    objc_setAssociatedObject(self.target, key, self, OBJC_ASSOCIATION_ASSIGN);
}

- (void)clockRunning{
    
    //获取本地时区
    NSTimeZone *zone = [NSTimeZone localTimeZone];
    //获取日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    //设置日历的时区
    [calendar setTimeZone:zone];
    //取出当前的时分秒
    NSDateComponents *currents = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitTimeZone fromDate:currentDate];
    
    CGFloat secondAngle = (M_PI * 2 / 60) * currents.second;
    self.secondView.transform = CGAffineTransformMakeRotation(secondAngle);
    
    CGFloat minuteAngle = (M_PI * 2 / 60) * currents.minute;
    self.minuteView.transform = CGAffineTransformMakeRotation(minuteAngle);
    
    CGFloat hourAngle = (M_PI * 2 / 12) * currents.hour;
    self.hourView.transform = CGAffineTransformMakeRotation(hourAngle);
    
}

void clockMethod(id target, SEL _cmd){
    
    //通过关联属性,拿到self(WGClockViewController)
    id vc = objc_getAssociatedObject(target, key);
    [vc clockRunning];
}

-(void)dealloc{
    [_link invalidate];
    _link = nil;
    NSLog(@"WGClockViewController销毁了");
}













@end
