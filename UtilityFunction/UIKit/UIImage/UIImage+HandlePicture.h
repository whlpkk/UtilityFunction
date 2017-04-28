//
//  UIImage+Extend.h
//  xiwu
//
//  Created by yzk on 14-10-15.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HandlePicture)

/**
 *  处理图片的转向问题
 *
 *  @return 转向后图片
 */
- (UIImage *)rotateImage;

/**
 *  等比压缩图片到屏幕的分辨率
 *
 *  @return 压缩后图片
 */
- (UIImage *)compressImage;

/**
 *  等比压缩图片
 *
 *  @param defineWidth 压缩后图片宽度
 *
 *  @return 压缩后图片
 */
- (UIImage *)compressImageForTargetWidth:(CGFloat)targetWidth;


/**
 *  加水印图
 *
 *  @param markImage 水印图
 *  @param rect      水印图位置
 *
 *  @return 添加水印图后的图片
 */
- (UIImage *)setWaterMarkImage:(UIImage *)markImage inRect:(CGRect)rect;

/**
 *  加水印文字
 *
 *  @param markString 水印文字
 *  @param rect       水印文字位置
 *  @param color      水印文字颜色
 *  @param font       水印文字字体
 *
 *  @return 添加水印文字后的图片
 */
- (UIImage *)setWaterMarkString:(NSString *)markString
                         inRect:(CGRect)rect
                          color:(UIColor *)color
                           font:(UIFont *)font;

@end
