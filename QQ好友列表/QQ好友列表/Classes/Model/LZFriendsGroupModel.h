//
//  LZFriendsGroupModel.h
//  QQ好友列表
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZFriendsGroupModel : NSObject

/** 存放每行显示的内容*/
@property (nonatomic, strong)NSArray *friends;
/** headerView 显示的内容*/
@property (nonatomic, copy)NSString *name;
/** 在线人数*/
@property (nonatomic, assign)int online;
/** 展开的时候*/
@property (nonatomic, assign) BOOL open;

@end
