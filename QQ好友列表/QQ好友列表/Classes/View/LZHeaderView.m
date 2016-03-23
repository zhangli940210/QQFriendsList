//
//  LZHeaderView.m
//  QQ好友列表
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//

#import "LZHeaderView.h"
#import "LZFriendsGroupModel.h"

@interface LZHeaderView ()

@property (nonatomic, weak) UIButton *nameBtn;

@property (nonatomic, weak) UILabel *text_Label;

@end

@implementation LZHeaderView

- (void)setGroup:(LZFriendsGroupModel *)group
{
    _group = group;
    
    // 给按钮设置文字
    [self.nameBtn setTitle:group.name forState:UIControlStateNormal];
    // 显示在线人数
    self.text_Label.text = [NSString stringWithFormat:@"%zd/%zd", group.online, group.friends.count];
}

+ (instancetype)headerViewWith:(UITableView *)tableview
{
    static NSString *ID = @"headerView";
    // 去缓存池里面找
    LZHeaderView *header = [tableview dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[LZHeaderView alloc] initWithReuseIdentifier:ID];
    }
    
    return header;
}

//  当headerview 上子控件只需 做一次操作的  或者  要显示出来的    就写在以下方法中
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 1.创建按钮
        UIButton *btn = [[UIButton alloc] init];
        // 2.设置按钮图片
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        // 3.设置按钮标题文字颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 4.设置按钮的内容居左显示
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 5.设置按钮的内边距
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 6.设置按钮label的内边距
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        // 7.设置图片居中显示
        btn.imageView.contentMode = UIViewContentModeCenter;
        // 8.不允许剪切超出部分
        btn.imageView.clipsToBounds = NO;
        // 9.赋值
        self.nameBtn = btn;
        [self.contentView addSubview:btn];
        // 10.添加按钮点击事件
        [btn addTarget:self action:@selector(nameBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        // 1.创建UILabel对象
        UILabel *label = [[UILabel alloc] init];
        // 2.居右显示
        label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label];
        self.text_Label = label;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮尺寸
    self.nameBtn.frame = self.bounds;
    // 设置label尺寸
    CGFloat lblY = 0;
    CGFloat lblW = 150;
    CGFloat lblh = self.bounds.size.height;
    CGFloat lblX = self.bounds.size.width - lblW - 10;
    self.text_Label.frame = CGRectMake(lblX, lblY, lblW, lblh);
    
    // 每次当控件加载到父控件的时候都会调用这个方法，包括init 完一次就会调用一次
    if (self.group.open) {
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    }else{
        self.nameBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

- (void)nameBtnClick
{
    self.group.open = !self.group.open;
    
    if (_pBlock) {
        _pBlock();
    }
    // 重绘
    [self setNeedsDisplay];
}

@end
