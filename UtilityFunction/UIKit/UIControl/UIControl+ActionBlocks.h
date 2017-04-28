//
//  UIControl+ActionBlocks.h
//  IOS-Categories
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/lavoy/ALActionBlocks

#import <UIKit/UIKit.h>
typedef void (^UIControlActionBlock)(id weakSender);

@interface UIControl (ActionBlocks)

/**
 *  用block处理点击事件
 *
 *  @param actionBlock   处理事件的block
 *  @param controlEvents 事件类型
 */
- (void)addActionBlock:(UIControlActionBlock)actionBlock
      forControlEvents:(UIControlEvents)controlEvents;

/**
 *  删除相关事件类型的block事件
 *
 *  @param controlEvents 事件类型
 */
- (void)removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
