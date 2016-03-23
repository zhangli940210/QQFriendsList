//
//  ViewController.m
//  QQ好友列表
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "ViewController.h"
#import "LZFriendsGroupModel.h"
#import "LZFriendsModel.h"
#import "LZHeaderView.h"
#import "MJExtension.h"


@interface ViewController () //<LZHeaderViewDelegate>

//存放fiend内容
@property (nonatomic, strong)NSArray *friendsArr;

@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)friendsArr
{
    if (_friendsArr == nil) {
        // 告诉MJExtension这个框架LZFriendsGroupModel的friends数组属性中装的是LZFriendsModel 模型
        [LZFriendsGroupModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"friends" : [LZFriendsModel class]};
        }];
        
        _friendsArr = [LZFriendsGroupModel mj_objectArrayWithFilename:@"friends.plist"];
    }
    return _friendsArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma  mark - 数据源方法
// 总共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendsArr.count;
}

// 每组返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 取出当前section 的model
    LZFriendsGroupModel *model = self.friendsArr[section];
    return model.open ? model.friends.count : 0;
}

// 每行显示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"friends";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    // 取组数据
    LZFriendsGroupModel *group = self.friendsArr[indexPath.section];
    // 取行数据
    LZFriendsModel *model = group.friends[indexPath.row];
    
    // 赋值
    cell.textLabel.text = model.name;
    cell.textLabel.backgroundColor = model.isVip?[UIColor redColor] : [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:model.icon];
    
    return cell;
    
}

//  返回一个header 给tableview 显示
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LZHeaderView *header = [LZHeaderView headerViewWith:tableView];
    // 设置代理
//    header.delegate = self;
    header.pBlock = ^ {
        [tableView reloadData];
    };
    LZFriendsGroupModel *group = self.friendsArr[section];
    header.group = group;
    return header;
}

//#pragma mark - header的代理方法
//- (void)headerView:(LZHeaderView *)view
//{
//    [self.tableView reloadData];
//}

/**
 *  设置headerVIew 的高度
 *
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

@end
