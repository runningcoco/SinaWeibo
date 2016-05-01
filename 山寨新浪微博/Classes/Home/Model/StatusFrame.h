//
//  StatusFrame.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-3-31.
//  Copyright (c) 2015年 echochief. All rights reserved.
//  模型存放一个子控件的所有frame数据，cell的高度，数据模型


#import <Foundation/Foundation.h>

// 昵称字体
#define StatusCellNameFont [UIFont systemFontOfSize:15]
// 时间字体
#define StatusCellTimeFont [UIFont systemFontOfSize:12]
// 来源字体
#define StatusCellSourceFont StatusCellTimeFont
// 正文字体
#define StatusCellContentFont [UIFont systemFontOfSize:14]
// 被转发微博的正文字体
#define StatusCellRetweetContentFont [UIFont systemFontOfSize:13]
// cell之间的间距
#define StatusCellMargin 15

#define StatusCellBorderW 10

@class Status;

@interface StatusFrame : NSObject
@property (nonatomic, strong) Status *status;

// 原创微博整体
@property (nonatomic, assign ) CGRect originalViewF;
// 微博头像
@property (nonatomic, assign ) CGRect iconViewF;
// 微博会员图标
@property (nonatomic, assign ) CGRect vipViewF;
// 微博配图
@property (nonatomic, assign ) CGRect photosViewF;
// 微博昵称
@property (nonatomic, assign ) CGRect nameLabelF;
// 微博时间
@property (nonatomic, assign ) CGRect timeLabelF;
// 微博来源
@property (nonatomic, assign ) CGRect sourceLabelF;
// 微博正文
@property (nonatomic, assign ) CGRect contentLabelF;

// 转发微博整体
@property (nonatomic, assign) CGRect retweetViewF;
// 转发微博正文 + 昵称
@property (nonatomic, assign) CGRect retweetContentLabelF;
// 转发配图
@property (nonatomic, assign) CGRect retweetPhotosViewF;
// 底部工具条
@property (nonatomic, assign) CGRect toolbarF;
// cell高度
@property (nonatomic, assign) CGFloat cellHeight;

@end
