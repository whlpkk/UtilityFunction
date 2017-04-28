//
//  UIView+Find.m
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+Find.h"

@implementation UIView (Find)

- (UIView *)findSuperViewWithName:(NSString *)name
{
    for (UIView *superView = self; superView; superView = superView.superview) {
        Class cl = [superView class];
        NSString *desc = [cl description];

        if ([name isEqualToString:desc]) {
            return superView;
        }
    }

    return nil;
}

- (UIView *)findSubviewWithName:(NSString *)name
{
    Class cl = [self class];
    NSString *desc = [cl description];

    if ([name isEqualToString:desc]) {
        return self;
    }

    for (NSUInteger i = 0; i < [self.subviews count]; i++) {
        UIView *subView = [self.subviews objectAtIndex:i];
        subView = [subView findSubviewWithName:name];

        if (subView) {
            return subView;
        }
    }

    return nil;
}

- (BOOL)findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }

    for (UIView *v in self.subviews) {
        if ([v findAndResignFirstResponder]) {
            return YES;
        }
    }

    return NO;
}

- (UIView *)findFirstResponderView
{
    if ( ([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]]) &&
         (self.isFirstResponder) ) {
        return self;
    }

    for (UIView *subView in self.subviews) {
        UIView *fv = [subView findFirstResponderView];

        if (fv) {
            return fv;
        }
    }

    return nil;
}

@end
