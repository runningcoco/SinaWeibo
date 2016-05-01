//
//  DropdownMenu.h
//  山寨新浪微博
//
//  Created by echochief on 15-3-20.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DropdownMenu;

@protocol DropdownMenuDelegate <NSObject>
@optional

- (void)dropdownMenuDidDismiss:(DropdownMenu *)menu;
- (void)dropdownMenuDidShow:(DropdownMenu *)menu;
@end

@interface DropdownMenu : UIView

@property (nonatomic, weak) id<DropdownMenuDelegate> delegate;

+ (instancetype)menu;


//显示
- (void)showFrom:(UIView *)from;

//销毁
- (void)dismiss;


//内容
@property (nonatomic,strong) UIView *content;

@property (nonatomic,strong) UIViewController *contentController;

@end
