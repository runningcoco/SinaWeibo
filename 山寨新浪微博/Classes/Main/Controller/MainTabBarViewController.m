//
//  MainTabBarViewController.m
//  山寨新浪微博
//
//  Created by echochief on 15-3-16.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeTableViewController.h"
#import "MessageCenterTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "NavigationController.h"
#import "TabBar.h"
#import "ComposeViewController.h"

@interface MainTabBarViewController () <TabBarDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化子控制器
    HomeTableViewController *home = [[HomeTableViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MessageCenterTableViewController *messageCenter = [[MessageCenterTableViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    DiscoverTableViewController *discover = [[DiscoverTableViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    ProfileTableViewController *profile = [[ProfileTableViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    //添加一个按钮到tabBar中
//    UIButton *plusBtn = [[UIButton alloc] init];
//    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
//    [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//    
//    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateHighlighted];
//    [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
//    
//    plusBtn.size = plusBtn.currentBackgroundImage.size;
//    plusBtn.centerX = self.tabBar.width * 0.5;
//    plusBtn.centerY = self.tabBar.height * 0.5;
//    
//    [self.tabBar addSubview:plusBtn];
    
    //更换系统自带的tabbar
    TabBar *tabBar = [[TabBar alloc] init];
    //先执行delegate的属性；若后执行，修改属性就会报错
    [self setValue:tabBar forKeyPath:@"tabBar"];

}

- (void) addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置子控制器的文字和图片
//    childVc.view.backgroundColor = [UIColor whiteColor];
    
//    childVc.tabBarItem.title = title;
//    childVc.navigationItem.title = title;
    
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *textAttrs4 = [NSMutableDictionary dictionary];
    textAttrs4[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs4 forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttrs4 = [NSMutableDictionary dictionary];
    selectedTextAttrs4[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs4 forState:UIControlStateSelected];
    
    //从外传进来一个小控制器————导航控制器
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVc];
    //添加子控制器
    [self addChildViewController:nav];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(TabBar *)tabBar
{
    ComposeViewController *compose = [[ComposeViewController alloc] init];
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:compose];
    
    [self presentViewController:nav animated:YES completion:nil];
}


@end
