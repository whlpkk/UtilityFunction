//
//  UIView+Snapshot.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIView (Snapshot)

- (UIImage *)viewSnapshot
{
    return [self viewSnapshotWithOpaque:self.opaque];
}

- (UIImage *)viewSnapshotWithOpaque:(BOOL)opaque
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, opaque, [UIScreen mainScreen].scale);

    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    } else { // IOS7之前的版本
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
