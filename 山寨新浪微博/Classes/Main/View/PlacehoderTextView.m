//
//  PlacehoderTextView.m
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-4-3.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import "PlacehoderTextView.h"

@implementation PlacehoderTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        UILabel *label = [[UILabel alloc] init];
//        label.textColor = [UIColor grayColor];
        
        // 通知
        [NotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc
{
    [NotificationCenter removeObserver:self];
}

// 监听文字改变
- (void)textDidChange
{
    // 重新调用
    [self setNeedsDisplay];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    [self setNeedsDisplay];
    
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
    
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    // setNeedsDisplay会在下一个消息循环时刻，调用drawRect:
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
//    [self.placeholderColor set];
    // 如果有输入文字，则直接返回
    if (self.hasText)  return;
    
    // 文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor?self.placeholder:[UIColor grayColor];
    // 画文字
//    [self.placeholder drawAtPoint:CGPointMake(5, 8) withAttributes:attrs];
    
    CGFloat x = 5;
    CGFloat w = rect.size.width - 2 * x;
    CGFloat y = 8;
    CGFloat h = rect.size.height - 2 * y;
    
    CGRect placeholderRect = CGRectMake(x, y, w, h);
    [self.placeholder drawInRect:placeholderRect withAttributes:attrs];

}

@end
