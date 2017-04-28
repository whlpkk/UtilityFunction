//
//  UILabel+GetTextSize.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "UILabel+GetTextSize.h"

@implementation UILabel (GetTextSize)

- (double)getTextWidth
{
    NSDictionary *attributes = @{
        NSFontAttributeName: self.font
    };

    return [self getAttributedTextWidthWithAttributes:attributes];
}

- (double)getTextHeight;
{
    NSDictionary *attributes = @{
        NSFontAttributeName: self.font
    };
    return [self getAttributedTextHeightWithAttributes:attributes];
}

- (double)getAttributedTextWidthWithAttributes:(NSDictionary *)attributes
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGRect rect = [self.text
                   boundingRectWithSize:CGSizeMake(MAXFLOAT, self.frame.size.height)
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                             attributes:attributes
                                context:nil];

    return ceil(rect.size.width);

#else
    CGSize size = [self.text
                    sizeWithFont:self.font
               constrainedToSize:CGSizeMake(MAXFLOAT, self.frame.size.height)];
    return ceil(size.width);

#endif
}

- (double)getAttributedTextHeightWithAttributes:(NSDictionary *)attributes
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    CGRect rect = [self.text
                   boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT)
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                             attributes:attributes
                                context:nil];
    return ceil(rect.size.height);

#else
    CGSize size = [self.text
                    sizeWithFont:self.font
               constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return ceil(size.height);

#endif
}

@end
