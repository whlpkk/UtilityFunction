//
//  UIColor+HEX.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIColor+HEX.h"

@implementation UIColor (HEX)

+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [UIColor colorWithHex:hex alpha:1];
}

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF) / 255.0
                           green:((hex >> 8) & 0xFF) / 255.0
                            blue:(hex & 0xFF) / 255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithWholeRed:(NSInteger)red
                         green:(NSInteger)green
                          blue:(NSInteger)blue
{
    return [self colorWithWholeRed:red
                             green:green
                              blue:blue
                             alpha:1.0];
}

+ (UIColor *)colorWithWholeRed:(NSInteger)red
                         green:(NSInteger)green
                          blue:(NSInteger)blue
                         alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.f
                           green:green / 255.f
                            blue:blue / 255.f
                           alpha:alpha];
}

@end
