//
//  LoadMoreFooter.m
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-3-29.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "LoadMoreFooter.h"

@implementation LoadMoreFooter

+ (instancetype)footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LoadMoreFooter" owner:nil options:nil] lastObject];
}

@end
