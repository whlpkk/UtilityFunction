//
//  MJRefreshViewController.m
//  s
//
//  Created by wendy on 15/6/29.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "MJRefreshViewController.h"
#import "SwipeTableCell.h"
#import "MJRefresh.h"
@interface MJRefreshViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation MJRefreshViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, IPHONE_HEIGHT - APP_NAVI_HEIGHT)];
    _tableView.delegate        = self;
    _tableView.dataSource      = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];

    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];

    _tableView.header.updatedTimeHidden = YES;
    _tableView.footer.hidden = YES;


    [ApplicationDelegate showDescription:@"详细的使用方法，请下载demo：https://github.com/CoderMJLee/MJRefresh" OnView:self.view];
}

- (void)headerRefreshing
{
    //网络请求



    [_tableView.header setTitle:@"在这儿自定义下拉刷新的显示" forState:MJRefreshHeaderStateRefreshing];


    [_tableView.header endRefreshing];
}

- (void)footerRefreshing
{
    //网络请求


    [_tableView.footer setTitle:@"在这儿自定义上拉刷新的显示" forState:MJRefreshFooterStateRefreshing];

    [_tableView.footer endRefreshing];
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
#pragma mark - tableView delegate & dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 15;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellStr = @"SwipeTableCell";
    SwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];

    if (!cell) {
        cell = [[SwipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", (long)[indexPath row]];
    return cell;
}

@end
