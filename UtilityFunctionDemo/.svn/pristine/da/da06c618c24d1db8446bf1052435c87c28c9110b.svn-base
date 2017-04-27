//
//  BOAlertController.h
//  xcv
//
//  Created by yzk on 14/11/13.
//  Copyright (c) 2014年 cooperlink. All rights reserved.
//

//系统alertView，可以自适应IOS8和IOS7.

//eg:
//RIButtonItem *cancleItem = [RIButtonItem itemWithLabel:@"Cancle"
//                                                  type:RIButtonItemType_Cancel
//                                                action:^{
//                                                    NSLog(@"Cancle");
//                                                }];
//RIButtonItem *destructiveItem = [RIButtonItem itemWithLabel:@"Destructive"
//                                                       type:RIButtonItemType_Destructive
//                                                     action:^{
//                                                         NSLog(@"Destructive");
//                                                     }];
//RIButtonItem *otherItem1 = [RIButtonItem itemWithLabel:@"Other1"
//                                                  type:RIButtonItemType_Other
//                                                action:^{
//                                                    NSLog(@"Other1");
//                                                }];
//
//BOAlertController *alert = [[BOAlertController alloc] initWithTitle:@"title"
//                                                            message:@"message"
//                                                     viewController:self];
//[alert addButtons:@[cancleItem,otherItem1,destructiveItem]];
//[alert show]; or [alert showInView:self.view];

typedef enum {
    BOAlertControllerType_AlertView    = 1,
    BOAlertControllerType_ActionSheet
}BOAlertControllerType;

#define isIOS8  ([[[UIDevice currentDevice]systemVersion]floatValue]>=8)

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RIButtonItem.h"

@interface BOAlertController : NSObject

- (id)initWithTitle:(NSString *)title message:(NSString *)message viewController:(UIViewController *)inViewController;

- (void)addButton:(RIButtonItem *)button;
- (void)addButtons:(NSArray *)buttons;

//Show ActionSheet in all versions
- (void)showInView:(UIView *)view;

//Show AlertView in all versions
- (void)show;

@end