//
//  NNStatusBarHUD.m
//  NNStatusBarHUD
//
//  Created by iOS on 16/10/3.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNStatusBarHUD.h"
// 文字字体
#define NNMessageFont [UIFont systemFontOfSize:12]
// 屏幕宽
#define NNWidth [UIScreen mainScreen].bounds.size.width

/** 窗口的高度 */
static const CGFloat WindowHeight = 25;
/** 消息的停留时间 */
static CGFloat const NNMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const NNAnimationDuration = 0.25;

@implementation NNStatusBarHUD

/** 全局的窗口 */
static UIWindow *_window;
/** 定时器 */
static NSTimer *_timer;


#pragma mark - 显示窗口
+ (void)showWindow
{
    CGFloat windowH = WindowHeight;
    CGRect frame = CGRectMake(0, -windowH, NNWidth, windowH);
    
    // 显示窗口
    _window.hidden = YES;
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = frame;
    _window.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:NNAnimationDuration animations:^{
        _window.frame = frame;
    }];
}
/**
 *  显示信息
 *
 *  @param msg   信息
 *  @param imageName 图片
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName
{
    [self showMessage:msg image:[UIImage imageNamed:imageName]];
}
/**
 * 显示普通信息
 * @param msg       信息
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    if (_window) return;
    
    // 停止定时器
    [_timer invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = NNMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = _window.bounds;
    [_window addSubview:button];
    
    // 定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:NNMessageDuration target:self selector:@selector(hideLoading) userInfo:nil repeats:NO];
}


#pragma mark - 显示自定义信息
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

#pragma mark - 显示成功信息
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"NNStatusBarHUD.bundle/success"]];
}


#pragma mark - 显示失败信息
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"NNStatusBarHUD.bundle/error"]];
}


#pragma mark - 显示正在处理的信息
+ (void)showLoading:(NSString *)msg
{
    if (_window) return;
    
    // 停止定时器
    [_timer invalidate];
    _timer = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = NNMessageFont;
    label.frame = _window.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [_window addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : NNMessageFont}].width;
    CGFloat centerX = (_window.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = _window.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [_window addSubview:loadingView];
}

#pragma mark - 隐藏加载信息
+ (void)hideLoading
{
    [UIView animateWithDuration:NNAnimationDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y =  - frame.size.height;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        _window = nil;
        _timer = nil;
    }];
}


@end
