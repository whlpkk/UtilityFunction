//
//  RootViewController.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"UtilityFunction";
    _items = @{
        @"d_ThirdLibrary": @[@"AFN_网络请求框架",
                             @"DDMenu_左右侧滑效果",
                             @"IQKeyBoard_键盘管理",
                             @"Lumberjack_彩色日志打印",
                             @"Hud_风火轮",
                             @"MJRefresh_下拉刷新",
                             @"NJKWeb_WebView进度条",
                             @"SDWebImage_异步加载图片",
                             @"StyledPage_自定义页面控制效果",
                             @"WaterFall_瀑布流",
                             @"YTKNetwork_网络请求框架",
                             @"Reachability_判断网络状态"
        ],
        @"c_CommonView": @[@"TappedLabel_带事件的label",
                           @"BTLabel_label垂直方向布局",
                           @"SwipeTable_侧滑显示多个按钮",
                           @"OBShapeedButton_非矩形button",
                           @"SelectTable_弹出选择框"

        ],
        @"b_Video": @[@"First_视频播放"],
        @"a_QRCode": @[@"GeneratorQRCode_生成二维码",
                       @"ScanQRCode_扫描二维码"],
        @"e_Encryption": @[@"NSString+Crypto",
                           @"NSData+Crypto",
                           @"GTMBase64",
                           @"MD5"],
        @"f_AlertManager": @[@"YZKAlertManager"],
        @"g_DeviceManager": @[@"YZKDeviceManager"],
        @"h_GDMap": @[@"GDLocation_高德地图定位",
                      @"GDAnnotation_高德地图大头针标注"]
    };
    [self.tableView reloadData];

    _allKey = [[_items allKeys] sortedArrayUsingComparator:^NSComparisonResult (id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];

    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_allKey count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_allKey[section] substringFromIndex:2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_items objectForKey:_allKey[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    // Configure the cell...
    cell.textLabel.text =  [_items objectForKey:_allKey[indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *fullName =  [_items objectForKey:_allKey[indexPath.section]][indexPath.row];
    NSString *name = [[fullName componentsSeparatedByString:@"_"] firstObject];
    NSString *className = [name stringByAppendingString:@"ViewController"];
    Class class = NSClassFromString(className);

    UIViewController *controller = [[class alloc]init];

    if (!controller) {
        return;
    }

    controller.title = name;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
