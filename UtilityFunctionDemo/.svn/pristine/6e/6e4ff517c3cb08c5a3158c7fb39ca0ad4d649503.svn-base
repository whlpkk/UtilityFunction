//
//  SelectTableView.h
//  RongChuang
//
//  Created by yzk on 15/5/13.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZKSelectTableView;

@protocol YZKSelectTableViewDelegate <NSObject>

- (void)    selectTableView:(YZKSelectTableView *)selectTableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YZKSelectTableView : UIView

- (instancetype)initWithTitle:(NSString *)title
                    dataArray:(NSArray *)dataArray
                     delegate:(id<YZKSelectTableViewDelegate>)delegate;

@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UITableView *tableView;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleTextColor;
@property (nonatomic, strong) UIColor *titleBackgroundColor;
@property (nonatomic, assign) BOOL showsVerticalScrollIndicator;

- (void)showWithView:(UIView *)view;

@end
