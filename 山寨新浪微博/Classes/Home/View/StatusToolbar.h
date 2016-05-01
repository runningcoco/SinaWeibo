//
//  StatusToolbar.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-3-31.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;

@interface StatusToolbar : UIView

+ (instancetype)toolbar;

@property (nonatomic, strong) Status *status;
@end
