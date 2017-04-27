//
//  UIImage+ImageEffects.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

- (UIImage *)applySubtleEffect;
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

/**
 *  添加毛玻璃效果
 *
 *  @param blurRadius            模糊半径(默认30,推荐值 3   半径值越大越模糊 ,值越小越清楚 )
 *  @param tintColor             模糊颜色(毛玻璃颜色)
 *  @param saturationDeltaFactor 色差饱和度因子(0是黑白灰, 9是浓彩色, 1是原色  默认1.8。 “彩度”，英文是称Saturation，即饱和度。将无彩色的黑白灰定为0，最鲜艳定为9s，这样大致分成十阶段，让数值和人的感官直觉一致。)
 *  @param maskImage             遮罩图片
 *
 *  @return 毛玻璃模糊后的图片
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

@end
