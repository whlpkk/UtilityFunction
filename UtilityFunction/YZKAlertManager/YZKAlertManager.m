//
//  YZKAlert.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "YZKAlertManager.h"

@implementation YZKAlertManager

+ (UIAlertView *)alertWithMsg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];

    [alert show];
    return alert;
}

+ (UIAlertView *)alertWithTitle:(NSString *)title
                            msg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];

    [alert show];
    return alert;
}

+ (BOAlertController *)alertWithMsg:(NSString *)msg
                     viewController:(UIViewController *)viewController
                             action:(void (^)(void))action
{
    BOAlertController *alert = [[BOAlertController alloc] initWithTitle:nil message:msg viewController:viewController];
    RIButtonItem *item = [RIButtonItem itemWithLabel:@"确定"
                                                type:RIButtonItemType_Cancel
                                              action:action];

    [alert addButton:item];
    [alert show];
    return alert;
}

+ (BOAlertController *)alertWithTitle:(NSString *)title
                                  msg:(NSString *)msg
                       viewController:(UIViewController *)viewController
                               action:(void (^)(void))action
{
    BOAlertController *alert = [[BOAlertController alloc] initWithTitle:title message:msg viewController:viewController];
    RIButtonItem *item = [RIButtonItem itemWithLabel:@"确定"
                                                type:RIButtonItemType_Cancel
                                              action:action];

    [alert addButton:item];
    [alert show];
    return alert;
}

+ (BOAlertController *)alertWithMsg:(NSString *)msg
                     viewController:(UIViewController *)viewController
                      confirmAction:(void (^)(void))confirmAction
                       cancelAction:(void (^)(void))cancelAction
{
    BOAlertController *alert = [[BOAlertController alloc] initWithTitle:nil message:msg viewController:viewController];
    RIButtonItem *confirmItem = [RIButtonItem itemWithLabel:@"确定"
                                                       type:RIButtonItemType_Other
                                                     action:confirmAction];
    RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:@"取消"
                                                      type:RIButtonItemType_Cancel
                                                    action:cancelAction];

    [alert addButton:confirmItem];
    [alert addButton:cancelItem];
    [alert show];
    return alert;
}

+ (BOAlertController *)alertWithTitle:(NSString *)title
                                  msg:(NSString *)msg
                       viewController:(UIViewController *)viewController
                        confirmAction:(void (^)(void))confirmAction
                         cancelAction:(void (^)(void))cancelAction
{
    BOAlertController *alert = [[BOAlertController alloc] initWithTitle:title message:msg viewController:viewController];
    RIButtonItem *confirmItem = [RIButtonItem itemWithLabel:@"确定"
                                                       type:RIButtonItemType_Other
                                                     action:confirmAction];
    RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:@"取消"
                                                      type:RIButtonItemType_Cancel
                                                    action:cancelAction];

    [alert addButton:confirmItem];
    [alert addButton:cancelItem];
    [alert show];
    return alert;
}

+ (BOAlertController *)actionSheetWithTitle:(NSString *)title
                                        msg:(NSString *)msg
                             viewController:(UIViewController *)viewController
                            itemButtonArray:(NSArray *)itemByttonArray
{
    BOAlertController *actionSheet = [[BOAlertController alloc] initWithTitle:title message:msg viewController:viewController];

    [actionSheet addButtons:itemByttonArray];
    [actionSheet showInView:viewController.view];
    return actionSheet;
}

@end
