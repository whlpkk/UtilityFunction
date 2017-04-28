//
//  UIView+RecursiveDescription.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RecursiveDescription)

/**
 *  子视图层级树
 *
 *  @return 子视图层级树
 */
- (NSString *)subHierarchy;

/**
 *  父视图层级树
 *
 *  @return 父视图层级树
 */
- (NSString *)superHierarchy;


@end
