//
//  ViewController.m
//  s
//
//  Created by yzk on 14-9-30.
//  Copyright (c) 2014年 cooperlink. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.frame = CGRectMake(50, 120+7, 50, 30);
    cancleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn setTitle:@"sadas" forState:UIControlStateHighlighted];
    [cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancleBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [cancleBtn addTarget:self
                  action:@selector(cancelButtonClicked)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleBtn];
    
}

- (void)cancelButtonClicked
{
    
}

@end
