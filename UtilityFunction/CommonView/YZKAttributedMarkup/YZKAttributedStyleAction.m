//
//  WPAttributedStyleAction.m
//  WPAttributedMarkupDemo
//
//  Created by Nigel Grange on 20/10/2014.
//  Copyright (c) 2014 Nigel Grange. All rights reserved.
//

#import "YZKAttributedStyleAction.h"

@implementation YZKAttributedStyleAction

- (instancetype)initWithTouchAction:(void (^)())beginAction
{
    return [self initWithTouchBeginAction:beginAction
                          TouchMoveAction:nil
                           TouchEndAction:nil];
}

- (instancetype)initWithTouchBeginAction:(void (^)())beginAction
                         TouchMoveAction:(void (^)())moveAction
                          TouchEndAction:(void (^)())endAction
{
    self = [super init];

    if (self) {
        self.beginAction = beginAction;
        self.moveAction  = moveAction;
        self.endAction   = endAction;
    }

    return self;
}

+ (instancetype)styledActionWithAction:(void (^)())action
{
    YZKAttributedStyleAction *container = [[YZKAttributedStyleAction alloc] initWithTouchBeginAction:action
                                                                                     TouchMoveAction:nil
                                                                                      TouchEndAction:nil];

    return container;
}

+ (instancetype)styledActionWithTouchBeginAction:(void (^)())beginAction
                              TouchMoveAction:(void (^)())moveAction
                               TouchEndAction:(void (^)())endAction
{
    YZKAttributedStyleAction *container =
        [[YZKAttributedStyleAction alloc] initWithTouchBeginAction:beginAction
                                                   TouchMoveAction:moveAction
                                                    TouchEndAction:endAction];

    return container;
}

@end