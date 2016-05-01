//
//  AppDelegate.m
//  山寨新浪微博
//
//  Created by echochief on 15-3-15.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "AppDelegate.h"
#import "OAuthViewController.h"
#import "AccountTool.h"
#import "SDWebImageManager.h"

@interface AppDelegate ()
@property (nonatomic, assign) UIBackgroundTaskIdentifier task;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //设置根控制器
    Account *account = [AccountTool account];
    
    if (account) { // 之前已经登录过
        [self.window switchRootViewController];
    } else {
        self.window.rootViewController = [[OAuthViewController alloc] init];
   
    }
    //显示窗口
    [self.window makeKeyAndVisible];

    return YES;

}
//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = [UIColor whiteColor];
//    vc1.tabBarItem.title = @"首页";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
//    //申明图片渲染出来还是原始图片
//    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    NSMutableDictionary *textAttrs1 = [NSMutableDictionary dictionary];
//    textAttrs1[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [vc1.tabBarItem setTitleTextAttributes:textAttrs1 forState:UIControlStateNormal];
//    
//    NSMutableDictionary *selectedTextAttrs1 = [NSMutableDictionary dictionary];
//    selectedTextAttrs1[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [vc1.tabBarItem setTitleTextAttributes:selectedTextAttrs1 forState:UIControlStateSelected];
//   
//    
//    
//    UIViewController *vc2 = [[UIViewController alloc] init];
//    vc2.view.backgroundColor = [UIColor yellowColor];
//    vc2.tabBarItem.title = @"消息";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
//    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_message_center_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    NSMutableDictionary *textAttrs2 = [NSMutableDictionary dictionary];
//    textAttrs2[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [vc2.tabBarItem setTitleTextAttributes:textAttrs2 forState:UIControlStateNormal];
//    
//    NSMutableDictionary *selectedTextAttrs2 = [NSMutableDictionary dictionary];
//    selectedTextAttrs2[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [vc2.tabBarItem setTitleTextAttributes:selectedTextAttrs2 forState:UIControlStateSelected];

//    UIViewController *vc3 = [[UIViewController alloc] init];
//    vc3.view.backgroundColor = [UIColor whiteColor];
//    vc3.tabBarItem.title = @"发现";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
//    vc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discover_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    NSMutableDictionary *textAttrs3 = [NSMutableDictionary dictionary];
//    textAttrs3[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [vc3.tabBarItem setTitleTextAttributes:textAttrs3 forState:UIControlStateNormal];
//    
//    NSMutableDictionary *selectedTextAttrs3 = [NSMutableDictionary dictionary];
//    selectedTextAttrs3[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [vc3.tabBarItem setTitleTextAttributes:selectedTextAttrs3 forState:UIControlStateSelected];
//   
//    
//    UIViewController *vc4 = [[UIViewController alloc] init];
//    vc4.view.backgroundColor = [UIColor grayColor];
//    vc4.tabBarItem.title = @"我";
//    vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//    vc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_profile_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    NSMutableDictionary *textAttrs4 = [NSMutableDictionary dictionary];
//    textAttrs4[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [vc4.tabBarItem setTitleTextAttributes:textAttrs4 forState:UIControlStateNormal];
//    
//    NSMutableDictionary *selectedTextAttrs4 = [NSMutableDictionary dictionary];
//    selectedTextAttrs4[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [vc4.tabBarItem setTitleTextAttributes:selectedTextAttrs4 forState:UIControlStateSelected];
   
//    tabbarVc.viewControllers = @[vc1,vc2,vc3,vc4];



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//当应用程序进入后台时，调用
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    //向操作系统申请后台运行的资格，能维持多久是不确定的
      __block UIBackgroundTaskIdentifier task = [application beginBackgroundTaskWithExpirationHandler:^{
        // 当申请的后台运行时间已经过期，就会调用这个block
        
        //结束任务
        [application endBackgroundTask:task];
    }];
    // 在info.plist中设置后台播放模式
    // 0kb的MP3文件，没有声音，循环播放
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    //取消下载
    [mgr cancelAll];
    
    //清除内存中所有图片
    [mgr.imageCache clearMemory];
}
@end
