//
//  UIColor+HEX.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

/**
 *  使用16进制设置颜色
 *
 *  @param hex 16进制值, eg: 0xffffff
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha;


/**
 *  使用10进制设置颜色
 *
 *  @param red   红色值, eg: 255
 *  @param green 绿色值, eg: 255
 *  @param blue  蓝色值, eg: 255
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithWholeRed:(NSInteger)red
                         green:(NSInteger)green
                          blue:(NSInteger)blue;

+ (UIColor *)colorWithWholeRed:(NSInteger)red
                         green:(NSInteger)green
                          blue:(NSInteger)blue
                         alpha:(CGFloat)alpha;


@end
