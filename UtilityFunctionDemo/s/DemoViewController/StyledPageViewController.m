//
//  StyledPageViewController.m
//  s
//
//  Created by wendy on 15/6/25.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "StyledPageViewController.h"
#import "PageControlDemoTableViewCell.h"

@interface StyledPageViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation StyledPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT - APP_NAVI_HEIGHT) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;

    [self.view addSubview:tableview];
    [ApplicationDelegate showDescription:@"StyledPageControl是UIPageControl的扩展，可提供更多的定制功能，可更改颜色、间隙宽度、样式和直径。" OnView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        return 1;
    } else if (section == 4) {
        return 1;
    } else if (section == 5) {
        return 1;
    } else {
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"PageControlStyleDefault";
    } else if (section == 1) {
        return @"PageControlStyleStrokedCircle";
    } else if (section == 2) {
        return @"PageControlStylePressed1";
    } else if (section == 3) {
        return @"PageControlStylePressed2";
    } else if (section == 4) {
        return @"PageControlStyleWithPageNumber";
    } else if (section == 5) {
        return @"PageControlStyleThumb";
    } else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 34;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    PageControlDemoTableViewCell *cell = (PageControlDemoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[PageControlDemoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.pageControl setNumberOfPages:10];
    [cell.pageControl setCurrentPage:5];

    if (indexPath.section == 0) {
        [cell.pageControl setPageControlStyle:PageControlStyleDefault];

        if (indexPath.row == 0) {
            // default style without changes
        } else if (indexPath.row == 1) {
            // change color
            [cell.pageControl setCoreNormalColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
            [cell.pageControl setCoreSelectedColor:[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1]];
        } else if (indexPath.row == 2) {
            // change gap width
            [cell.pageControl setGapWidth:5];
            // change diameter
            [cell.pageControl setDiameter:9];
        }
    } else if (indexPath.section == 1) {
        [cell.pageControl setPageControlStyle:PageControlStyleStrokedCircle];
    } else if (indexPath.section == 2) {
        [cell.pageControl setPageControlStyle:PageControlStylePressed1];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    } else if (indexPath.section == 3) {
        [cell.pageControl setPageControlStyle:PageControlStylePressed2];
        [cell.pageControl setBackgroundColor:[UIColor darkGrayColor]];
    } else if (indexPath.section == 4) {
        [cell.pageControl setPageControlStyle:PageControlStyleWithPageNumber];
        [cell.pageControl setNumberOfPages:14];
    } else if (indexPath.section == 5) {
        [cell.pageControl setPageControlStyle:PageControlStyleThumb];
        [cell.pageControl setThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-normal.png"]];
        [cell.pageControl setSelectedThumbImage:[UIImage imageNamed:@"pagecontrol-thumb-selected.png"]];
        [cell.pageControl setNumberOfPages:10];
    }

    return cell;
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
