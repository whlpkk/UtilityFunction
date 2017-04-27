//
//  UIView+RecursiveDescription.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+RecursiveDescription.h"

@implementation UIView (RecursiveDescription)

- (NSInteger)depth
{
    NSInteger depth = 0;

    if ([self superview]) {
        depth = [[self superview] depth] + 1;
    }

    return depth;
}

- (NSString *)subHierarchy
{
    NSMutableString *debugInfo = [[NSMutableString alloc] initWithString:@"\n"];
    NSInteger depth = [self depth];

    for (int counter = 0; counter < depth; counter++) {
        [debugInfo appendString:@"|  "];
    }

    [debugInfo appendFormat:@"%@: ( %.0f, %.0f, %.0f, %.0f )", NSStringFromClass([self class]), self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height];

    for (UIView *subview in self.subviews) {
        [debugInfo appendString:[subview subHierarchy]];
    }

    return debugInfo;
}

- (NSString *)superHierarchy
{
    NSMutableString *debugInfo = [[NSMutableString alloc] init];

    if (self.superview) {
        [debugInfo appendString:[self.superview superHierarchy]];
    } else {
        [debugInfo appendString:@"\n"];
    }

    NSInteger depth = [self depth];

    for (int counter = 0; counter < depth; counter++) {
        [debugInfo appendString:@"|  "];
    }

    [debugInfo appendFormat:@"%@: ( %.0f, %.0f, %.0f, %.0f )\n", NSStringFromClass([self class]), self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height];

    return debugInfo;
}

@end
