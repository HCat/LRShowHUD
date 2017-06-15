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

- (void)setUpCommonConfig{

    


}

#pragma mark - 显示纯文本信息

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration{
    [self showTextOnly:text duration:duration inView:nil];

}

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration
              inView:(UIView *)view{
    
    [self showTextOnly:text duration:duration inView:view config:nil];

}

+ (void)showTextOnly:(NSString *)text
            duration:(NSTimeInterval)duration
              inView:(UIView *)view
              config:(ConfigShowHUDBlock)config{



}

@end
