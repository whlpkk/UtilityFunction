//
//  YZKAlert.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BOAlertController.h"

@interface YZKAlertManager : NSObject

/**
 *  弹出提示框信息
 *
 *  @param title 标题
 *  @param msg   内容
 *
 *  @return UIAlertView
 */
+ (UIAlertView *)alertWithMsg:(NSString *)msg;
+ (UIAlertView *)alertWithTitle:(NSString *)title
                            msg:(NSString *)msg;


/**
 *  弹出带有一个确定按钮的提示框信息
 *
 *  @param title          提示标题
 *  @param msg            提示内容
 *  @param viewController 显示在哪个viewController
 *  @param action         点击确定按钮触发的事件
 *
 *  @return BOAlertController
 */
+ (BOAlertController *)alertWithMsg:(NSString *)msg
                     viewController:(UIViewController *)viewController
                             action:(void (^)(void))action;

+ (BOAlertController *)alertWithTitle:(NSString *)title
                                  msg:(NSString *)msg
                       viewController:(UIViewController *)viewController
                               action:(void (^)(void))action;


/**
 *  弹出带有一个确定，一个取消，共两个按钮的提示框信息
 *
 *  @param title          提示标题
 *  @param msg            提示内容
 *  @param viewController 显示在哪个viewController
 *  @param confirmAction  点击确定按钮触发的事件
 *  @param cancelAction   点击取消按钮触发的事件
 *
 *  @return BOAlertController
 */
+ (BOAlertController *)alertWithMsg:(NSString *)msg
                     viewController:(UIViewController *)viewController
                      confirmAction:(void (^)(void))confirmAction
                       cancelAction:(void (^)(void))cancelAction;

+ (BOAlertController *)alertWithTitle:(NSString *)title
                                  msg:(NSString *)msg
                       viewController:(UIViewController *)viewController
                        confirmAction:(void (^)(void))confirmAction
                         cancelAction:(void (^)(void))cancelAction;



/**
 *  弹出一个actionSheet
 *
 *  @param title           actionSheet标题
 *  @param msg             actionSheet内容
 *  @param viewController  actionSheet显示在那个viewController
 *  @param itemByttonArray array of RIButtonItem
 *
 *  @return BOAlertController
 */
+ (BOAlertController *)actionSheetWithTitle:(NSString *)title
                                        msg:(NSString *)msg
                             viewController:(UIViewController *)viewController
                            itemButtonArray:(NSArray *)itemByttonArray;

@end
