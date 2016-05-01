//
//  StatusCell.h
//  山寨新浪微博
//
//  Created by 我是僵尸 on 15-3-31.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusFrame;

@interface StatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) StatusFrame *statusFrame;
@end
