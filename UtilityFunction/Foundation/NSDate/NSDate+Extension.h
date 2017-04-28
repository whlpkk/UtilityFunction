//
//  NSDate+Extension.h
//  IOS-Categories
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)day;
- (NSUInteger)month;
- (NSUInteger)year;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)dateAfterHours:(NSInteger)hours;
+ (NSDate *)dateAfterDate:(NSDate *)date hour:(NSInteger)hour;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)dateAfterDay:(NSInteger)day;
+ (NSDate *)dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回month月后的日期(若month为负数,则为|month|月前的日期)
 */
- (NSDate *)dateAfterMonth:(NSInteger)month;
+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month;

@end
