//
//  TappedLabelViewController.m
//  s
//
//  Created by wendy on 15/6/19.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "TappedLabelViewController.h"

@interface TappedLabelViewController ()

@end

@implementation TappedLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [ApplicationDelegate showDescription:@"富文本展示:对一段文本进行不同格式（字体、颜色）的显示，还可以为文本增加点击事件、在文本中增加图片等等" OnView:self.view];
    // Do any additional setup after loading the view.

    /*
       body标签:对所有的文本进行统一设置
       red标签:red标签内的字符串按red标签的属性进行设置,help标签同样
       标签内可以嵌套标签
     */

    NSDictionary *styleDict = @{
        @"body": @{
            NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:18.0]
        },
        @"red": @{
            NSFontAttributeName: [UIFont systemFontOfSize:16],
            NSForegroundColorAttributeName: [UIColor redColor],
        },
        @"help": @{
            NSFontAttributeName: [UIFont systemFontOfSize:18],
            NSForegroundColorAttributeName: [UIColor blueColor],
            kYZKAttributedStyleAction: [YZKAttributedStyleAction styledActionWithAction:^{
                                                                     NSLog(@"Help action");
                                                                 }],
        },
        @"image": [UIImage imageNamed:@"thumbIcon"],
    };

    YZKTappableLabel *tappedLabel = [[YZKTappableLabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];

    tappedLabel.lineBreakMode = NSLineBreakByWordWrapping;
    tappedLabel.numberOfLines = 0;

    tappedLabel.attributedText = [@"普通文本显示 <help>按照help标签属性显示</help> <red>按照red标签属性显示</red> 显示<image> </image>图片" attributedStringWithStyleDict:styleDict];
    [self.view addSubview:tappedLabel];
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
