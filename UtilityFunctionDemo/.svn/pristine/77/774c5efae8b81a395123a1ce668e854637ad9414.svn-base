//
//  GeneratorQRCodeViewController.m
//  s
//
//  Created by yzk on 15/6/26.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "GeneratorQRCodeViewController.h"
#import "QRCodeGenerator.h"

@implementation GeneratorQRCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 200, 200)];
    imageView.centerX = self.view.boundsCenter.x;
    imageView.image = [QRCodeGenerator qrImageForString:@"123456789" imageSize:imageView.bounds.size.width];
    [self.view addSubview: imageView];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 200, 200)];
    imageView2.centerX = self.view.boundsCenter.x;
    UIImage *image = [QRCodeGenerator qrImageForString:@"yzk" imageSize:imageView2.bounds.size.width];
    imageView2.image = [QRCodeGenerator twoDimensionCodeImage:image withAvatarImage:[UIImage imageNamed:@"pic1"]];
    [self.view addSubview: imageView2];
}

@end
