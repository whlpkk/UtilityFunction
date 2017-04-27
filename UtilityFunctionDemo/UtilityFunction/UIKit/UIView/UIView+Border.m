//
//  UIView+Border.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

- (UIView *)addLineWithFrame:(CGRect)frame
                   lineColor:(UIColor *)lineColor
{
    UIView *view = [[UIView alloc] initWithFrame:frame];

    view.backgroundColor = lineColor;
    [self addSubview:view];
    return view;
}

- (UIImageView *)addLineWithFrame:(CGRect)frame
                       imageNamed:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];

    imageView.image = [UIImage imageNamed:imageName];
    [self addSubview:imageView];
    return imageView;
}

- (void)addBorder
{
    [self addBorderWithWidth:2.0f];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
{
    [self addBorderWithWidth:borderWidth
                       color:[UIColor purpleColor]];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
{
    [self addBorderWithWidth:borderWidth
                       color:color
                      corner:0];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                    corner:(CGFloat)corner
{
    [self addBorderWithWidth:borderWidth
                       color:[UIColor purpleColor]
                      corner:corner];
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
                    corner:(CGFloat)corner
{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = corner;
}

- (void)addBorderWithWidth:(CGFloat)borderWidth
                     color:(UIColor *)color
           roundingCorners:(UIRectCorner)corners
              cornerRadius:(CGFloat)cornerRadius
{
    CAShapeLayer *layer = [CAShapeLayer layer];

    layer.lineWidth = borderWidth * 2;
    layer.strokeColor = color.CGColor;
    layer.fillColor = nil;
    layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                       byRoundingCorners:corners
                                             cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    [self.layer addSublayer:layer];

    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                           byRoundingCorners:corners
                                                 cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    self.layer.mask = maskLayer;
}

@end
