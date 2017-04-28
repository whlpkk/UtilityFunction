//
//  NSDate+Format.h
//  xiwu
//
//  Created by yzk on 14-7-21.
//  Copyright (c) 2014年 cooperLink. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, DateFormat) {
    DateFormatWithAll,               // 2014-03-04 13:23:35:67
    DateFormatWithAllOther,          // 2014-03-04 13:23:35.67
    DateFormatWithDateAndTime,       // 2014-03-04 13:23:35
    DateFormatWithDateAndMinite,     // 2014-03-04 13:23

    DateFormatWithTime,              // 13:23:35
    DateFormatWithPreciseTime,       // 13:23:35:67

    DateFormatWithYearMonthDay,      // 2014-03-04
    DateFormatWithYearMonthDayOther, // 2014年03月04日
    DateFormatWithYearMonth,         // 2014-03
    DateFormatWithMonthDay,          // 03-04
    DateFormatWithYear,              // 2014
    DateFormatWithMonth,             // 03
    DateFormatWithDay,               // 04
};

@interface NSDate (Format)

/**
 *  NSDate 转 NSString
 *
 *  @param format 日期格式类型
 *
 *  @return 日期字符串
 */
- (NSString *)stringWithDateFormat:(DateFormat)format;
- (NSDateComponents *)dateComponents;

@end

@interface NSString (Format)

/**
 *  NSString 转 NSDate
 *
 *  @param format 日期格式类型
 *
 *  @return NSDate日期
 */
- (NSDate *)dateWithDateFormat:(DateFormat)format;

/**
 *  将某种格式的日期字符串 转 另一种格式的日期字符串
 *
 *  @param toFormat   目标日期格式类型
 *  @param fromFormat 源日期格式类型
 *
 *  @return 转换后的日期字符串
 */
- (NSString *)stringConverToDateFormat:(DateFormat)toFormat
                        fromDateFormat:(DateFormat)fromFormat;

@end
