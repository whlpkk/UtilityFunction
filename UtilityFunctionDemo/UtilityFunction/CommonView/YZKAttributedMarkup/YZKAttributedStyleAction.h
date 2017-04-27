//
//  WPAttributedStyleAction.h
//  WPAttributedMarkupDemo
//
//  Created by Nigel Grange on 20/10/2014.
//  Copyright (c) 2014 Nigel Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kYZKAttributedStyleAction @"kYZKAttributedStyleAction"

@interface YZKAttributedStyleAction : NSObject

@property (readwrite, copy) void (^ beginAction) ();
@property (readwrite, copy) void (^ moveAction) ();
@property (readwrite, copy) void (^ endAction) ();

- (instancetype)initWithTouchBeginAction:(void (^)())beginAction
                         TouchMoveAction:(void (^)())moveAction
                          TouchEndAction:(void (^)())endAction;

+ (instancetype)styledActionWithAction:(void (^)())action;
+ (instancetype)styledActionWithTouchBeginAction:(void (^)())beginAction
                                 TouchMoveAction:(void (^)())moveAction
                                  TouchEndAction:(void (^)())endAction;



@end