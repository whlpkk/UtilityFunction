//
//  RIButtonItem.m
//  Shibui
//
//  Created by Jiva DeVoe on 1/12/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "RIButtonItem.h"

@implementation RIButtonItem
@synthesize label;
@synthesize action;

+ (id)item
{
    return [[self alloc] init];
}

+ (id)itemWithLabel:(NSString *)inLabel
{
    RIButtonItem *newItem = [self item];
    [newItem setLabel:inLabel];
    return newItem;
}

+ (id)itemWithLabel:(NSString *)inLabel
             action:(void(^)(void))action
{
    RIButtonItem *newItem = [self itemWithLabel:inLabel];
    if (action) {
        [newItem setAction:action];
    }
    return newItem;
}

+ (id)itemWithLabel:(NSString *)inLabel
               type:(RIButtonItemType)type
             action:(void (^)(void))action
{
    RIButtonItem *newItem = [self itemWithLabel:inLabel
                                         action:action];
    [newItem setType:type];
    return newItem;
}

@end

