//
//  SwipeTableViewController.m
//  s
//
//  Created by wendy on 15/6/19.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "SwipeTableViewController.h"
#import "SwipeTableCell.h"

@interface SwipeTableViewController ()<MGSwipeTableCellDelegate>
{
    NSArray *_items;
}
@end

@implementation SwipeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _items = @[@"苹果", @"香蕉", @"橘子", @"火龙果", @"樱桃", @"奇异果", @"芒果", @"车厘子", @"石榴", @"牛油果"];

    [self.tableView registerClass:[SwipeTableCell class] forCellReuseIdentifier:@"SwipeTableCell"];


    [ApplicationDelegate showDescription:@"MGSwipeTableCell是非常容易使用的UITableViewCell子类，允许显示带有各种转换的swippable buttons。" OnView:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellStr = @"SwipeTableCell";
    SwipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr forIndexPath:indexPath];

//    if (!cell) {
//        cell = [[SwipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
//    }

    cell.delegate = self;
    cell.textLabel.text = _items[indexPath.row];
    return cell;
}

- (NSArray *) swipeTableCell:(MGSwipeTableCell *)cell
    swipeButtonsForDirection:(MGSwipeDirection)direction
               swipeSettings:(MGSwipeSettings *)swipeSettings
           expansionSettings:(MGSwipeExpansionSettings *)expansionSettings;
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    swipeSettings.transition = indexPath.row % 5;

    if (direction == MGSwipeDirectionRightToLeft) {
        expansionSettings.buttonIndex = -1;
        expansionSettings.fillOnTrigger = NO;

        NSMutableArray *buttonArray = [NSMutableArray array];

        // 删除按钮
        UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        delBtn.frame = CGRectMake(0, 0, 77, 100);
        delBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [delBtn setTitle:@"购买" forState:UIControlStateNormal];
        [delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [delBtn setBackgroundColor:[UIColor redColor]];


        // 评论按钮
        UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        commentBtn.frame = CGRectMake(0, 0, 77, 100);
        commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [commentBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [commentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [commentBtn setBackgroundColor:[UIColor lightGrayColor]];

        [buttonArray addObject:delBtn];
        [buttonArray addObject:commentBtn];

        return buttonArray;
    }

    return nil;
}

- (BOOL) swipeTableCell:(MGSwipeTableCell *)cell
    tappedButtonAtIndex:(NSInteger)index
              direction:(MGSwipeDirection)direction
          fromExpansion:(BOOL)fromExpansion
{
    if (index == 0) {
        NSLog(@"执行购买动作");
    } else if (index == 1) {
        NSLog(@"执行收藏动作");
    }

    // 处理
    return YES;
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
