//
//  ComposeToolbar.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ComposeToolbarButtonTypeCamera, // 拍照
    ComposeToolbarButtonTypePicture, // 相册
    ComposeToolbarButtonTypeMention, // @
    ComposeToolbarButtonTypeTrend, // #
    ComposeToolbarButtonTypeEmotion // 表情
} ComposeToolbarButtonType;

@class ComposeToolbar;

@protocol ComposeToolbarDelegate <NSObject>
@optional
- (void)composeToolbar:(ComposeToolbar *)toolbar didClickButton:(ComposeToolbarButtonType)buttonType;
@end

@interface ComposeToolbar : UIView
@property (nonatomic, weak) id <ComposeToolbarDelegate> delegate;
@property (nonatomic,assign) BOOL showEmotionButton;
@end
