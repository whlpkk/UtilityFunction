//
//  UIView+Find.h
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Find)

/**
 *  根据父视图的类名name，查找父视图
 */
- (UIView *)findSuperViewWithName:(NSString *)name;

/**
 *  根据子视图的类名name，查找子视图
 */
- (UIView *)findSubviewWithName:(NSString *)name;

/**
 *  查找并取消当前视图下的(深度遍历)第一响应者
 *
 *  @return 成功失败
 */
- (BOOL)findAndResignFirstResponder;

/**
 *  查找当前视图下的(深度遍历)第一响应者
 */
- (UIView *)findFirstResponderView;

@end
