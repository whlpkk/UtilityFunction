//
//  SelectTableView.m
//  RongChuang
//
//  Created by yzk on 15/5/13.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "YZKSelectTableView.h"

@interface YZKSelectTableView ()
<UITableViewDataSource,
 UITableViewDelegate>
{
    NSArray *_dataArray;
    NSString *_title;
    UIView *_popView;
    UIView *_titleView;
    UIControl *_control;

    id<YZKSelectTableViewDelegate> _delegate;
}

@end

@implementation YZKSelectTableView

- (instancetype)initWithTitle:(NSString *)title
                    dataArray:(NSArray *)dataArray
                     delegate:(id<YZKSelectTableViewDelegate>)delegate
{
    self = [super init];

    if (self) {
        _title = title;
        _dataArray = dataArray;
        _delegate = delegate;

        [self createView];
    }

    return self;
}

#pragma mark - setup UI

- (void)createView
{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];

    _control = [[UIControl alloc] init];
    [_control addTarget:self action:@selector(tapEvent) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_control];

    _popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 40, 200)];
    _popView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_popView];

    _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _popView.frame.size.width, 40)];
    _titleView.backgroundColor = [UIColor colorWithRed:6/255.0f green:53/255.0f blue:134/255.0f alpha:1];
    [_popView addSubview:_titleView];

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, _titleView.frame.size.width - 10 * 2, _titleView.frame.size.height)];
    _titleLabel.text = _title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor whiteColor];
    [_titleView addSubview:_titleLabel];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleView.frame), _popView.frame.size.width, _popView.frame.size.height - CGRectGetMaxY(_titleView.frame))];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorInset = UIEdgeInsetsZero;

    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }

    _tableView.tableFooterView = [[UIView alloc] init];
    [_popView addSubview:_tableView];
}

- (void)tapEvent
{
    [self dismissCompletion:nil];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleLabel.font = titleFont;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor
{
    _titleLabel.textColor = titleTextColor;
}

- (void)setTitleBackgroundColor:(UIColor *)titleBackgroundColor
{
    _titleView.backgroundColor = titleBackgroundColor;
}

- (void)setShowsVerticalScrollIndicator:(BOOL)showsVerticalScrollIndicator
{
    _tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator;
}

#pragma mark - public method

- (void)showWithView:(UIView *)view
{
    self.frame = view.bounds;
    _control.frame = self.bounds;
    [view addSubview:self];

    _popView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _popView.transform = CGAffineTransformMakeScale(0.05, 0.05);
    [UIView animateWithDuration:0.25
                     animations:^{
                         _popView.transform = CGAffineTransformIdentity;
                     }];
}

- (void)dismissCompletion:(void (^)(void))completion
{
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                         completion();
                         }

                         [self removeFromSuperview];
                     }];
}

#pragma mark - tableView delegate & dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray ? _dataArray.count : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getCellHeightWithText:_dataArray[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];

        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }

    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissCompletion:^{
              if ([_delegate respondsToSelector:@selector(selectTableView:didSelectRowAtIndexPath:)]) {
              [_delegate  selectTableView:self
                 didSelectRowAtIndexPath:indexPath];
              }
          }];
}

#pragma mark - private method

- (CGFloat)getCellHeightWithText:(NSString *)text
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(_tableView.frame.size.width - 30, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:17] }
                                     context:nil];
    CGFloat height = ceil(rect.size.height);

    if (height > 30) {
        return height + 20;
    } else {
        return 44;
    }
}

@end
