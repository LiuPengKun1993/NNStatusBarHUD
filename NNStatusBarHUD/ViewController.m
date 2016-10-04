//
//  ViewController.m
//  NNStatusBarHUD
//
//  Created by iOS on 16/10/3.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "ViewController.h"
#import "NNStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)message:(id)sender {
//    [NNStatusBarHUD showMessage:@"自定义加载信息" image:[UIImage imageNamed:@"1"]];
//    [NNStatusBarHUD showMessage:@"自定义加载信息" imageName:@"1"];
    [NNStatusBarHUD showMessage:@"显示自定义信息"];
}

- (IBAction)hide:(id)sender {
    [NNStatusBarHUD hideLoading];
}

- (IBAction)loading:(id)sender {
    [NNStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)error:(id)sender {
    [NNStatusBarHUD showError:@"加载失败!"];
}

- (IBAction)success:(id)sender {
    [NNStatusBarHUD showSuccess:@"加载成功!"];
}

@end
