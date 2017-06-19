//
//  LRShowHUD.m
//
//  Created by hcat-89 on 2017/6/15.
//  Copyright © 2017年 hcat-89. All rights reserved.
//

#import "LRShowHUD.h"

@interface LRShowHUD()

@property(nonatomic,strong,readwrite) MBProgressHUD   *hud;

@end


@implementation LRShowHUD

#pragma makr - 初始化

- (instancetype)initWithView:(UIView *)view
{
    if (view == nil) {
        return nil;
    }
    self = [super init];
    if (self) {
        self.hud = [[MBProgressHUD alloc] initWithView:view];
        _hud.animationType             = MBProgressHUDAnimationZoom; // 默认动画样式
        _hud.removeFromSuperViewOnHide = YES;                        // 该视图隐藏后则自动从父视图移除掉
        [view addSubview:_hud];
    }
    return self;
}

#pragma mark - 

- (void)setUpCommonConfig:(NSString *)text{

    if (text && text.length > 0) {
        
        if (text.length > 10) {
            _hud.detailsLabel.text = text;
            _hud.detailsLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:14];
        }else{
            _hud.label.text = text;
            _hud.label.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:14];
        }
    
    }
    
    _hud.margin = 10.0f;
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.backgroundView.color = [UIColor clearColor];
    _hud.bezelView.layer.cornerRadius = 3.f;
    _hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.5f];

}

#pragma mark - 显示纯文本信息

+ (void)showTextOnly:(nonnull NSString *)text
            duration:(NSTimeInterval)duration{
    [self showTextOnly:text duration:duration inView:nil config:nil];

}

+ (void)showTextOnly:(nonnull NSString *)text
            duration:(NSTimeInterval)duration
              inView:(nullable UIView *)view{
    
    [self showTextOnly:text duration:duration inView:view config:nil];

}

+ (void)showTextOnly:(nonnull NSString *)text
            duration:(NSTimeInterval)duration
              inView:(nullable UIView *)view
              config:(nullable ConfigShowHUDBlock)config{

    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    LRShowHUD *showHud     = [[LRShowHUD alloc] initWithView:view];
    showHud.hud.mode = MBProgressHUDModeText;
    
    //默认配置
    [showHud setUpCommonConfig:text];
    
    // 配置额外的参数
    if (config) {
        config(showHud.hud);
    }
    
    // 显示
    [showHud.hud showAnimated:YES];

    // 延迟duration后消失
    [showHud hideAnimated:YES afterDelay:duration];
}

+ (nonnull instancetype)showTextOnly:(nonnull NSString *)text
                              inView:(nullable UIView *)view
                              config:(nullable ConfigShowHUDBlock)config{
    
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    LRShowHUD *showHud     = [[LRShowHUD alloc] initWithView:view];
    showHud.hud.mode = MBProgressHUDModeText;
    
    //默认配置
    [showHud setUpCommonConfig:text];
    
    // 配置额外的参数
    if (config) {
        config(showHud.hud);
    }
    
    // 显示
    [showHud.hud showAnimated:YES];

    return showHud;
    
}

#pragma mark - 显示菊花加载的HUD

+ (void)showActivityLoading:(nullable NSString *)text
                   duration:(NSTimeInterval)duration{

    [self showActivityLoading:text duration:duration inView:nil config:nil];

}

+ (void)showActivityLoading:(nullable NSString *)text
                   duration:(NSTimeInterval)duration
                     inView:(nullable UIView *)view{
    
    [self showActivityLoading:text duration:duration inView:view config:nil];

}


+ (void)showActivityLoading:(nullable NSString *)text
                   duration:(NSTimeInterval)duration
                     inView:(nullable UIView *)view
                     config:(nullable ConfigShowHUDBlock)config{

    LRShowHUD *showHud     = [[LRShowHUD alloc] initWithView:view];
    showHud.hud.mode = MBProgressHUDModeIndeterminate;
    
    //默认配置
    [showHud setUpCommonConfig:text];
    
    // 配置额外的参数
    if (config) {
        config(showHud.hud);
    }
    
    // 显示
    [showHud.hud showAnimated:YES];
    
    // 延迟duration后消失
    [showHud hideAnimated:YES afterDelay:duration];

}

+ (nonnull instancetype)showActivityLoading:(nullable NSString *)text
                                     inView:(nullable UIView *)view
                                     config:(nullable ConfigShowHUDBlock)config{
    
    LRShowHUD *showHud     = [[LRShowHUD alloc] initWithView:view];
    showHud.hud.mode = MBProgressHUDModeIndeterminate;
    
    //默认配置
    [showHud setUpCommonConfig:text];
    
    // 配置额外的参数
    if (config) {
        config(showHud.hud);
    }
    
    // 显示
    [showHud.hud showAnimated:YES];
    
    return showHud;

}

#pragma mark - 显示加载进度的HUD


#pragma mark - 隐藏

- (void)hideAnimated:(BOOL)isNeedAnimated{

     [_hud hideAnimated:isNeedAnimated];
    
}


- (void)hideAnimated:(BOOL)isNeedAnimated afterDelay:(NSTimeInterval)delay{

    [_hud hideAnimated:isNeedAnimated afterDelay:delay];

}

- (void)dealloc
{
    NSLog(@"LRShowHUD dealloc");
}

@end
