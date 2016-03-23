//
//  LZHeaderView.h
//  QQ好友列表
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZFriendsGroupModel;
//@class LZHeaderView;
//
//@protocol LZHeaderViewDelegate <NSObject>
//
//@optional
//- (void)headerView:(LZHeaderView *)view;
//@end
// 定义一个block类型
typedef void(^LZHeaderViewBlock)();

@interface LZHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWith:(UITableView *)tableview;

/** 模型数据*/
@property (nonatomic, strong)LZFriendsGroupModel *group;

//@property (nonatomic, weak) id<LZHeaderViewDelegate> delegate;
@property (nonatomic, copy) LZHeaderViewBlock pBlock;

@end
