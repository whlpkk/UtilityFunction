//
//  UIScrollView+AutoContentSize.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "UIScrollView+AutoContentSize.h"

@implementation UIScrollView (AutoContentSize)

- (void)autoContentSize
{
    [self autoContentSizeWithSpace:10];
}

- (void)autoContentSizeWithSpace:(float)space
{
    float maxRight = 0;
    float maxBottom = 0;

    for (UIView *sub in self.subviews) {
        if (sub.hidden) {
            continue;
        }

        float bottom = sub.frame.origin.y + sub.frame.size.height;
        float right = sub.frame.origin.x + sub.frame.size.width;
        maxBottom = (bottom > maxBottom) ? bottom : maxBottom;
        maxRight = (right > maxRight) ? right : maxRight;
    }

    self.contentSize = CGSizeMake(maxRight, maxBottom + space);
}

@end
