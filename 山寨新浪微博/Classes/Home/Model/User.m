//
//  User.m
//  山寨新浪微博
//
//  Created by 大侠 on 15-3-28.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "User.h"

@implementation User

- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    
    self.vip = mbtype > 2;
}


@end
