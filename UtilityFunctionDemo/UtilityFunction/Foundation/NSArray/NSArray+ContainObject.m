//
//  NSArray+ContainObject.m
//  s
//
//  Created by yzk on 15/7/9.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "NSArray+ContainObject.h"

@implementation NSArray (ContainObject)

- (BOOL)containsObjectWithKey:(NSString *)key value:(id)value
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@" %K == %@ ",key,value];
    NSArray *array = [self filteredArrayUsingPredicate:predicate];
    return array.count > 0;
}

@end
