//
//  LZFriendsModel.h
//  QQ好友列表
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZFriendsModel : NSObject

/** 名称*/
@property (nonatomic, copy)NSString *name;


/** 用户图片*/
@property (nonatomic, copy)NSString *icon;;

/** 个性签名*/
@property (nonatomic, copy)NSString *intro;;

/** 是否是vip*/
@property (nonatomic, assign,getter = isVip) BOOL vip;

@end
