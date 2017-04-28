//
//  NSString+GetTextSize.h
//  s
//
//  Created by yzk on 15/6/19.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GetTextSize)

/**
 *  计算string的高度
 *
 *  @param width 容器宽度
 *  @param font  string字体
 *
 *  @return string的高度
 */
- (double)getTextHeightWithConstrainedWidth:(CGFloat)width
                                       font:(UIFont *)font;

/**
 *  计算string的高度
 *
 *  @param width      容器宽度
 *  @param attributes 字体属性
 *
 *  @return string的高度
 */
- (double)getTextHeightWithConstrainedWidth:(CGFloat)width
                                 attributes:(NSDictionary *)attributes;


/**
 *  计算string的宽度
 *
 *  @param height 容器高度
 *  @param font   string字体
 *
 *  @return string的宽度
 */
- (double)getTextWidthWithConstrainedHeight:(CGFloat)height
                                       font:(UIFont *)font;

/**
 *  计算string的宽度
 *
 *  @param height     容器高度
 *  @param attributes 字体属性
 *
 *  @return string的宽度
 */
- (double)getTextWidthWithConstrainedHeight:(CGFloat)height
                                 attributes:(NSDictionary *)attributes;

@end
