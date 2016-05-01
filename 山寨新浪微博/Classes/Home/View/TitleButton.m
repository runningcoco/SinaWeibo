//
//  TitleButton.m
//  山寨新浪微博
//
//  Created by 大侠 on 15-3-28.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "TitleButton.h"

#define Margin 5

@implementation TitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    }
    return self;
}

//重写setFrame方法
- (void)setFrame:(CGRect)frame
{
    frame.size.width += Margin;
    [super setFrame:frame];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算titleLabel的frame
    self.titleLabel.x = self.imageView.x;
    
    //计算imageView的frame
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + Margin;

}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
