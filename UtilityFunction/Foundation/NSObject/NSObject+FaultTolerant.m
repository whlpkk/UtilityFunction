//
//  NSObject+FaultTolerant.m
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "NSObject+FaultTolerant.h"

@implementation NSObject (FaultTolerant)

- (NSString *)analysisConvertToString
{
    if ([self isKindOfClass:[NSNull class]] || !self) {
        return @"";
    } else if ([self isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", self];
    } else {
        return (NSString *)self;
    }
}

- (NSDictionary *)analysisConvertToDict
{
    if ([self isKindOfClass:[NSNull class]]) {
        return [NSDictionary dictionaryWithObjectsAndKeys:nil];
    } else if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self;
    } else {
        return nil;
    }
}

- (NSArray *)analysisConvertToArray
{
    if ([self isKindOfClass:[NSNull class]]) {
        return [NSArray arrayWithObjects:nil];
    } else if ([self isKindOfClass:[NSArray class]]) {
        return (NSArray *)self;
    } else {
        return nil;
    }
}

@end
