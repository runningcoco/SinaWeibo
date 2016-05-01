//
//  EmotionKeyboard.m
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-5.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "EmotionKeyboard.h"
#import "EmotionListView.h"
#import "EmotionTabBar.h"
#import "Emotion.h"
#import "MJExtension.h"

@interface EmotionKeyboard() <EmotionTabBarDelegate>
// 表情容纳控件
@property (nonatomic, weak) EmotionListView *showingListView;

@property (nonatomic, strong) EmotionListView *recentListView;
@property (nonatomic, strong) EmotionListView *defaultListView;
@property (nonatomic, strong) EmotionListView *emojiListView;
@property (nonatomic, strong) EmotionListView *lxhListView;


@property (nonatomic, weak) EmotionTabBar *tabBar;
@end

@implementation EmotionKeyboard

#pragma mark - 懒加载

- (EmotionListView *)recentListView
{
    if (!_recentListView) {
        self.recentListView = [[EmotionListView alloc] init];
    }
    return _recentListView;
}

- (EmotionListView *)defaultListView
{
    if (!_defaultListView) {
        self.defaultListView = [[EmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
        self.defaultListView.emotions = [Emotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _defaultListView;
}

- (EmotionListView *)emojiListView
{
    if (!_emojiListView) {
        self.emojiListView = [[EmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
        self.emojiListView.emotions = [Emotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _emojiListView;
}

- (EmotionListView *)lxhListView
{
    if (!_lxhListView) {
        self.lxhListView = [[EmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
        self.lxhListView.emotions = [Emotion objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _lxhListView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // tabbar
        EmotionTabBar *tabBar = [[EmotionTabBar alloc] init];
        tabBar.delegate = self;
        [self addSubview:tabBar];
        self.tabBar = tabBar;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super subviews];
    
    // tabBar
    self.tabBar.width = self.width;
    self.tabBar.height = 37;
    self.tabBar.x = 0;
    self.tabBar.y = self.height - self.tabBar.height;
    
    // 表情内容
    self.showingListView.x = self.showingListView.y = 0;
    self.showingListView.width = self.width;
    self.showingListView.height = self.tabBar.y;

}

#pragma mark - EmotionTabBarDelegate
- (void)emotionTabBar:(EmotionTabBar *)tabBar didSelectButton:(EmotionTabBarButtonType)buttonType
{
    // 移除contentView之前显示的控件
    [self.showingListView removeFromSuperview];
    
    // 根据按钮类型切换contentView上的listView
    switch (buttonType) {
        case EmotionTabBarButtonTypeRecent:{ // 最近
            [self addSubview:self.recentListView];
            break;
        }
            
        case EmotionTabBarButtonTypeDefault:{ // 默认
            [self addSubview:self.defaultListView];
            break;
        }
            
        case EmotionTabBarButtonTypeEmoji: {// Emoji
            [self addSubview:self.emojiListView];
            break;
        }
            
        case EmotionTabBarButtonTypeLxh: { // Lxh
            [self addSubview:self.lxhListView];
            break;
        }
    }
    // 设置正在显示的listView
    self.showingListView = [self.subviews lastObject];
    
    // 重新计算子控件的frame，重新调用layoutSubviews
    [self setNeedsLayout];
}


@end
