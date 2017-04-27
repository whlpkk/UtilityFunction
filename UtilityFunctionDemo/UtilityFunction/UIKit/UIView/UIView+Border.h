//
//  UIView+Border.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Border)

/**
 *  给view加一条线
 *
 *  @param frame     线的frame
 *  @param lineColor 线的颜色
 *
 *  @return 线的View
 */
- (UIView *)addLineWithFrame:(CGRect)frame
                   lineColor:(UIColor *)lineColor;

/**
 *  给view加一条线
 *
 *  @param frame     线的frame
 *  @param imageName 线的图片
 *
 *  @return 线的View
 */
- (UIImageView *)addLineWithFrame:(CGRect)frame
                       imageNamed:(NSString *)imageName;

/**
 *  给view加边框
 *
 *  @param borderWidth 边框宽度
 *  @param color       边框颜色
 *  @param corner      边框弧度
 */
- (void)addBorder;
- (void)addBorderWithWidth:(CGFloat)borderWidth;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                    corner:(CGFloat)corner;
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
                    corner:(CGFloat)corner;


/**
 *  给view加边框
 *
 *  @param borderWidth  边框宽度
 *  @param color        边框颜色
 *  @param corners      边框角位置
 *  @param cornerRadius 边框弧度
 */
- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
           roundingCorners:(UIRectCorner)corners
              cornerRadius:(CGFloat)cornerRadius;


@end
