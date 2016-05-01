//
//  UIWindow+Extension.m
//  山寨新浪微博
//
//  Created by 大侠 on 15-3-28.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "MainTabBarViewController.h"
#import "NewfeatureViewController.h"

@implementation UIWindow (Extension)

- (void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    //上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    //当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        self.rootViewController = [[MainTabBarViewController alloc] init];
    } else {
        self.rootViewController = [[NewfeatureViewController alloc] init];
        
        //将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }

}
@end
