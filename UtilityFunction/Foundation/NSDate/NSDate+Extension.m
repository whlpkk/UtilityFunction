//
//  NSDate+Extension.m
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/632840804/HYBNSDateExtension

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

- (NSUInteger)day
{
    return [NSDate day:self];
}

- (NSUInteger)month
{
    return [NSDate month:self];
}

- (NSUInteger)year
{
    return [NSDate year:self];
}

- (NSUInteger)hour
{
    return [NSDate hour:self];
}

- (NSUInteger)minute
{
    return [NSDate minute:self];
}

- (NSUInteger)second
{
    return [NSDate second:self];
}

+ (NSUInteger)day:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif

    return [dayComponents day];
}

+ (NSUInteger)month:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif

    return [dayComponents month];
}

+ (NSUInteger)year:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif

    return [dayComponents year];
}

+ (NSUInteger)hour:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif

    return [dayComponents hour];
}

+ (NSUInteger)minute:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif

    return [dayComponents minute];
}

+ (NSUInteger)second:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif

    return [dayComponents second];
}

- (NSDate *)dateAfterHours:(NSInteger)hours
{
    return [NSDate dateAfterDate:self hour:hours];
}

+ (NSDate *)dateAfterDate:(NSDate *)date hour:(NSInteger)hours
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];

    [componentsToAdd setHour:hours];

    return [calendar dateByAddingComponents:componentsToAdd
                                     toDate:date
                                    options:0];
}

- (NSDate *)dateAfterDay:(NSInteger)day
{
    return [NSDate dateAfterDate:self day:day];
}

+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];

    [componentsToAdd setDay:day];

    return [calendar dateByAddingComponents:componentsToAdd
                                     toDate:date
                                    options:0];
}

- (NSDate *)dateAfterMonth:(NSInteger)month
{
    return [NSDate dateAfterDate:self month:month];
}

+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];

    [componentsToAdd setMonth:month];

    return [calendar dateByAddingComponents:componentsToAdd
                                     toDate:date
                                    options:0];
}

@end
