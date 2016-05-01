//
//  ComposePhotoView.m
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "ComposePhotoView.h"

@interface ComposePhotoView()

@end

@implementation ComposePhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _photos = [NSMutableArray array];
    }
    return self;
}

- (void)addPhoto:(UIImage *)photo
{
    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.image = photo;
    [self addSubview:photoView];
    
    // 存储图片
    //    [_photos addObject:photo];
    [self.photos addObject:photo];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger count = self.subviews.count;
    int maxCol = 4;
    CGFloat imageWH = 70;
    CGFloat imageMargin = 10;
    
    for (int i = 0; i<count; i++) {
        UIImageView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (imageWH + imageMargin);
        
        int row = i / maxCol;
        photoView.y = row * (imageWH + imageMargin);
        photoView.width = imageWH;
        photoView.height = imageWH;
    }
}

//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self ];
//}

//- (NSArray *)photos
//{
//    return self.addedPhotos;
//}

//- (NSArray *)photos
//{
//    NSMutableArray *photos = [NSMutableArray array];
//    for (UIImageView *imageView in self.subviews) {
//        [photos addObject:imageView.image];
//    }
//    return photos;
//}


@end
