//
//  ComposePhotoView.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposePhotoView : UIView
- (void)addPhoto:(UIImage *)photo;

@property (nonatomic, strong, readonly) NSMutableArray *photos;

@end
