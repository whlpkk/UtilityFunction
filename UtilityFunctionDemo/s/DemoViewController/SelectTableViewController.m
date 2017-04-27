//
//  SelectTableViewController.m
//  s
//
//  Created by wendy on 15/6/23.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "SelectTableViewController.h"

@interface SelectTableViewController ()<YZKSelectTableViewDelegate>
{
    NSArray *_items;
}
@end

@implementation SelectTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [ApplicationDelegate showDescription:@"弹出选择框，类似安卓风格" OnView:self.view];

    UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delBtn.frame = CGRectMake(100, 100, 77, 100);
    delBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [delBtn setTitle:@"弹框" forState:UIControlStateNormal];
    [delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [delBtn setBackgroundColor:[UIColor redColor]];
    [delBtn addTarget:self action:@selector(showSelectedTable) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:delBtn];
}

- (void)showSelectedTable
{
    _items = @[@"招商银行", @"建设银行", @"工商银行", @"华夏银行", @"北京银行", @"农业银行"];
    YZKSelectTableView *selectTableView = [[YZKSelectTableView alloc] initWithTitle:@"请选择" dataArray:_items delegate:self];

    selectTableView.titleBackgroundColor = [UIColor grayColor];
    selectTableView.showsVerticalScrollIndicator = YES;
    [selectTableView showWithView:self.navigationController.view];
}

- (void)selectTableView:(YZKSelectTableView *)selectTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *desp = _items[indexPath.row];

    NSLog(@"您选择了%@", desp);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
