//
//  JSProgressHUD.h
//  JSProgressHUD
//
//  Created by ShenYj on 2017/5/26.
//  Copyright © 2017年 Auko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSProgressHUD : MBProgressHUD

/** 单例 */
+ (instancetype)sharedProgressHUD;
/** 显示遮罩 */
- (void)js_showHUDTo:(UIView *)view animated:(BOOL)animated;

@end
