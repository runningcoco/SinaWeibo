//
//  Emotion.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-7.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Emotion : NSObject
// 表情的文字表述
@property (nonatomic, copy) NSString *chs;
// 表情的png图片名
@property (nonatomic, copy) NSString *png;
 // emoji的图片名
@property (nonatomic, copy) NSString *code;

@end
