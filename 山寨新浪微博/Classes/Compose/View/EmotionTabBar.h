//
//  EmotionTabBar.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-5.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    EmotionTabBarButtonTypeRecent, // 最近
    EmotionTabBarButtonTypeDefault, // 默认
    EmotionTabBarButtonTypeEmoji, // emoji
    EmotionTabBarButtonTypeLxh, // 浪小花
} EmotionTabBarButtonType;

@class EmotionTabBar;

@protocol EmotionTabBarDelegate <NSObject>

@optional

- (void)emotionTabBar:(EmotionTabBar *)tabBar didSelectButton:(EmotionTabBarButtonType)buttonType;
@end

@interface EmotionTabBar : UIView
@property (nonatomic, weak) id <EmotionTabBarDelegate> delegate;
@end
