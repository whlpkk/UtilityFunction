//
//  UINavigationController+StackManager.h
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StackManager)

/**
 *  根据className查询当前NavigationController的viewControllers
 *
 *  @param className viewController的类名
 *
 *  @return 如果存在，返回该viewController，否则返回nil
 */
- (id)findViewController:(NSString *)className;

- (BOOL)isOnlyContainRootViewController;
- (UIViewController *)rootViewController;

/**
 *  根据className, 如果存在,pop到指定viewController, 否则无动作.
 *
 *  @param className 指定viewController的类名
 *  @param animated  是否添加动画
 *
 *  @return 所有被pop的viewController
 */
- (NSArray *)popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated;

/**
 *  pop指定层数viewController, 如果层级数大于等于当前NavigationController.viewControllers.count,则pop至rootViewController.
 *
 *  @param level    层数
 *  @param animated 是否添加动画
 *
 *  @return 所有被pop的viewController
 */
- (NSArray *)popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

@end
