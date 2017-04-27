//
//  OBShapeedButtonViewController.m
//  s
//
//  Created by wendy on 15/6/23.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "OBShapeedButtonViewController.h"

@interface OBShapeedButtonViewController ()

@end

@implementation OBShapeedButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [ApplicationDelegate showDescription:@"上面的按钮是系统的UIButton按钮，它的响应范围是矩形区域\n下面的按钮是OBShapedButton，它的响应区域是图片的区域" OnView:self.view];

    // 正常按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 64, 64)];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setImage:[UIImage imageNamed:@"icon_person_default"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    // OBShapedButton 按钮
    OBShapedButton *obShapedBtn = [[OBShapedButton alloc] initWithFrame:CGRectMake(110, 200, 64, 64)];
    [obShapedBtn setBackgroundColor:[UIColor lightGrayColor]];
    [obShapedBtn setImage:[UIImage imageNamed:@"icon_person_default"] forState:UIControlStateNormal];
    [obShapedBtn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:obShapedBtn];
}

- (void)btnAction
{
    NSLog(@"被点击啦");
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
