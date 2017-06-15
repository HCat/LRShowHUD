//
//  LRShowHUD.h
//
//  Created by hcat-89 on 2017/6/15.
//  Copyright © 2017年 hcat-89. All rights reserved.
//
//----------------------------------------------------------------------------------
//  1、基于 MBProgressHUD 1.9.2版本封装（支持横竖屏），增加了操作成功、失败的打勾打叉动画，
//    以及提供了一种可能适用于祝贺类的弹框提示所需的撒花（碎花粒子效果）效果，可酌情使用。
//    当前扩展的 GitHub 地址：https://github.com/HCat/LRShowHUD
//  2、当前版本：1.0.0
//  3、如果在使用过程中有问题或者建议可以随时联系我：375348234@qq.com 或者 GitHub issue
//
//  4、更新日志：

//----------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>


/* 配置MBProgressHUD中的参数.主要是基本属性.包括字体大小，颜色以及其他配置选项 */
typedef void(^ConfigShowHUDBlock)(MBProgressHUD *hud);

/* 配置自定义视图，视图赋值给MBProgressHUD.customView属性 */
typedef UIView *(^ConfigShowHUDCustomViewBlock)();


@interface LRShowHUD : NSObject

@property(nonatomic,strong,readonly) MBProgressHUD   *hud;

#pragma mark - 显示纯文本信息
/**
 显示纯文本信息,并且在几秒之后消失,展示在keyWindow层上
 
 @param text        提示信息
 @param duration    持续多久时间之后隐藏
 */

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration;


/**
 显示纯文本信息,并且在几秒之后消失,已经进行默认配置，如果需要特殊配置，请用
 + (void)showTextOnly:(NSString *)text
             duration:(NSTimeInterval)duration
               inView:(UIView *)view
               config:(ConfigShowHUDBlock)config;

 @param text        提示信息
 @param duration    持续多久时间之后隐藏
 @param view        展示的View 如果传nil，则展示在keyWindow层上
 */

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration
              inView:(UIView *)view;


/**
 显示纯文本信息，并且在几秒之后消失
 
 @param text        提示信息
 @param duration    持续多久时间之后隐藏
 @param view        展示的View 如果传nil，则展示在keyWindow层上
 @param config      MBProgressHUD的属性配置，默认在LRShowHUD.m中有进行配置，如果需要另外配置则在block中进行配置
 */

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration
              inView:(UIView *)view
              config:(ConfigShowHUDBlock)config;


#pragma mark - 隐藏
/**
 隐藏MBProgressHUD
 
 @param isNeedAnimated        是否需要动画
 */
- (void)hideAnimated:(BOOL)isNeedAnimated;


/**
 延迟隐藏MBProgressHUD
 
 @param isNeedAnimated        是否需要动画
 @param delay                 延迟时间
 */
- (void)hideAnimated:(BOOL)isNeedAnimated afterDelay:(NSTimeInterval)delay;


@end
