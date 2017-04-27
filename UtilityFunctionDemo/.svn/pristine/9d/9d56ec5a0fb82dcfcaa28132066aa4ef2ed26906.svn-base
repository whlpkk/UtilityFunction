//
//  BTLabelViewController.m
//  s
//
//  Created by wendy on 15/6/19.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "BTLabelViewController.h"

@interface BTLabelViewController ()

@end

@implementation BTLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [ApplicationDelegate showDescription:@"UILabel在垂直方向只是居中显示，该demo丰富了label的布局，可以在垂直方向上靠上、居中、靠下显示，同时可以设置边距来控制label显示的区域" OnView:self.view];

    BTLabel *label = [[BTLabel alloc] initWithFrame:self.view.frame];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.font = [UIFont systemFontOfSize:16];
    label.text = @"最近项目里面很多用户反馈说大图界面经常出现滑不动现象。只有ios8会这样。我自己也重现过，并且有一张图片是必现的。于是就在网上搜看有没有人解决过类似的问题。有几篇文章都有解决方案，都是关于响应事件传递到子View的。但是这些解决方案在我们项目没有用。我分析了一下";
    label.edgeInsets = UIEdgeInsetsMake(200, 50, 100, 50);
    label.verticalAlignment = BTVerticalAlignmentTop;
    [self.view addSubview:label];
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
