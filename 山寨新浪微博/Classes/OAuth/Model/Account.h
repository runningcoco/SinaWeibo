//
//  Account.h
//  山寨新浪微博
//
//  Created by 大侠 on 15-3-27.
//  Copyright (c) 2015年 echochief. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

// 用于调用access_token，接口获取授权后的access token
@property (nonatomic, copy) NSString *access_token;

// access_token的生命周期，单位为秒
@property (nonatomic, copy) NSNumber *expires_in;
// 当前授权用户的UID
@property (nonatomic, copy) NSString *uid;

//access_token的创建时间
@property (nonatomic, strong) NSDate *created_time;

//用户昵称
@property (nonatomic, copy) NSString *name;

+ (instancetype)accountWithDict:(NSDictionary *)dict;

@end
