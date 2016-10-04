//
//  NNStatusBarHUD.h
//  NNStatusBarHUD
//
//  Created by iOS on 16/10/3.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNStatusBarHUD : NSObject

/**
 *  显示自定义信息
 *
 *  @param msg   信息
 *  @param imageName 图片(仅限于本地图片)
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;
/**
 * 显示自定义信息
 * @param msg       信息
 * @param image     图片(仅限于本地图片)
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/** 显示自定义信息 */
+ (void)showMessage:(NSString *)msg;

/** 显示成功信息 */
+ (void)showSuccess:(NSString *)msg;

/** 显示失败信息 */
+ (void)showError:(NSString *)msg;

/** 显示正在处理的信息 */
+ (void)showLoading:(NSString *)msg;

/** 隐藏加载信息 */
+ (void)hideLoading;

@end
