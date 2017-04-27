//
//  UIImage+Extend.m
//  xiwu
//
//  Created by yzk on 14-10-15.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import "UIImage+HandlePicture.h"

@implementation UIImage (HandlePicture)

- (UIImage *)rotateImage
{
    CGImageRef imgRef           = self.CGImage;
    CGFloat width               = CGImageGetWidth(imgRef);
    CGFloat height              = CGImageGetHeight(imgRef);

    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds               = CGRectMake(0, 0, width, height);

    CGFloat scaleRatio          = 1;

    CGFloat boundHeight;
    UIImageOrientation orient = self.imageOrientation;

    switch (orient) {
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;

        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;

        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(width, height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;

        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;

        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight        = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width  = boundHeight;
            transform          = CGAffineTransformMakeTranslation(height, width);
            transform          = CGAffineTransformScale(transform, -1.0, 1.0);
            transform          = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;

        case UIImageOrientationLeft: //EXIF = 6
            boundHeight        = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width  = boundHeight;
            transform          = CGAffineTransformMakeTranslation(0.0, width);
            transform          = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;

        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight        = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width  = boundHeight;
            transform          = CGAffineTransformMakeScale(-1.0, 1.0);
            transform          = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;

        case UIImageOrientationRight: //EXIF = 8
            boundHeight        = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width  = boundHeight;
            transform          = CGAffineTransformMakeTranslation(height, 0.0);
            transform          = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;

        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
    }

    UIGraphicsBeginImageContext(bounds.size);

    CGContextRef context = UIGraphicsGetCurrentContext();

    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    } else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }

    CGContextConcatCTM(context, transform);

    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return imageCopy;
}

- (UIImage *)compressImage
{
    return [self compressImageForTargetWidth:[UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale];
}

- (UIImage *)compressImageForTargetWidth:(CGFloat)targetWidth
{
    float imageWidth = self.size.width;
    float imageHeight = self.size.height;
    float width = targetWidth;
    float height = self.size.height / (self.size.width / width);

    float widthScale = imageWidth / width;
    float heightScale = imageHeight / height;

    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(CGSizeMake(width, height));

    if (widthScale > heightScale) {
        [self drawInRect:CGRectMake(0, 0, imageWidth / heightScale, height)];
    } else {
        [self drawInRect:CGRectMake(0, 0, width, imageHeight / widthScale)];
    }

    // 从当前context中创建一个改变大小后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();

    return newImage;
}

- (UIImage *)setWaterMarkImage:(UIImage *)markImage inRect:(CGRect)rect
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);

    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //水印图
    [markImage drawInRect:rect];

    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newPic;
}

- (UIImage *)setWaterMarkString:(NSString *)markString
                         inRect:(CGRect)rect
                          color:(UIColor *)color
                           font:(UIFont *)font
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);

    //原图
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];

    //水印文字
    [markString drawInRect:rect
            withAttributes:@{ NSFontAttributeName: font,
                                    NSForegroundColorAttributeName: color }];

    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newPic;
}

@end
