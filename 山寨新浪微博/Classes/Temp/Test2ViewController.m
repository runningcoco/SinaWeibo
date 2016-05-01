//
//  Test2ViewController.m
//  山寨新浪微博
//
//  Created by echochief on 15-3-16.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "Test2ViewController.h"
#import "Test3TableViewController.h"

@interface Test2ViewController ()

@end

@implementation Test2ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    Test3TableViewController *test3 = [[Test3TableViewController alloc] init];
    test3.title = @"测试3控制器";
    [self.navigationController pushViewController:test3 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
