//
//  UIImage+ImageColor.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageColor)

/**
 *  用颜色生成图片
 *
 *  @param color 生成图片的颜色
 *
 *  @return 该颜色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  获取图片指定点的颜色
 *
 *  @param point 指定坐标
 *
 *  @return 指定点颜色
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

@end
