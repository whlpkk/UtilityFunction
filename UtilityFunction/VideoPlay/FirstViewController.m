//
//  FirstViewController.m
//  s
//
//  Created by Crystal on 15-6-26.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "FirstViewController.h"
#import "MovieViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设黑色只是为了衬出白色按钮，无关紧要
    self.view.backgroundColor=[UIColor blackColor];
    
    UIButton * playBT=[UIButton buttonWithType:UIButtonTypeCustom];
    playBT.frame=CGRectMake(0, 0, 200, 40);
    playBT.center=self.view.center;
    [playBT setTitle:@"play" forState:UIControlStateNormal];
    [playBT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [playBT addTarget:self action:@selector(playBTClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBT];
}
-(void)playBTClick
{
    MovieViewController * moiveVC=[[MovieViewController alloc]init];
    [self.navigationController pushViewController:moiveVC animated:YES];
}
- (void)didReceiveMemoryWarning {
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
