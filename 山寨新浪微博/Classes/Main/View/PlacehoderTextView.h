//
//  PlacehoderTextView.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//  占位文字

#import <UIKit/UIKit.h>

@interface PlacehoderTextView : UITextView
// 占位文字
@property (nonatomic, copy) NSString *placeholder;
// 占位文字颜色
@property (nonatomic, strong) UIColor *placeholderColor;
@end
