//
//  StatusPhotosView.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-1.
//  Copyright (c) 2015年 echochief. All rights reserved.
//  cell上的配图相册（显示1-9张）

#import <UIKit/UIKit.h>

@interface StatusPhotosView : UIView
@property (nonatomic, strong) NSArray *photos;

// 根据图片个数计算相册尺寸
+ (CGSize)sizeWithCount:(int)count;

@end
