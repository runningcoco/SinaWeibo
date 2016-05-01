//
//  UIBarButtonItem+Extension.h
//  山寨新浪微博
//
//  Created by echochief on 15-3-18.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
