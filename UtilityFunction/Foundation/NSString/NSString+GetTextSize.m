//
//  NSString+GetTextSize.m
//  s
//
//  Created by yzk on 15/6/19.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "NSString+GetTextSize.h"

@implementation NSString (GetTextSize)

- (double)getTextHeightWithConstrainedWidth:(CGFloat)width
                                       font:(UIFont *)font
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    return [self getTextHeightWithConstrainedWidth:width
                                        attributes:attributes];
}

- (double)getTextHeightWithConstrainedWidth:(CGFloat)width
                                 attributes:(NSDictionary *)attributes
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                  attributes:attributes
                                     context:nil];
    return ceil(rect.size.height);
}



- (double)getTextWidthWithConstrainedHeight:(CGFloat)height
                                       font:(UIFont *)font
{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    return [self getTextWidthWithConstrainedHeight:height
                                        attributes:attributes];
}

- (double)getTextWidthWithConstrainedHeight:(CGFloat)height
                                 attributes:(NSDictionary *)attributes
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                  attributes:attributes
                                     context:nil];
    return ceil(rect.size.width);
}

@end
