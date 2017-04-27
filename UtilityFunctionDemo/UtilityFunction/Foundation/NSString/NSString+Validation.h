//
//  NSString+Validation.h
//  RongChuang
//
//  Created by yzk on 15/6/17.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM (NSInteger, YZKValidationType) {
    YZKValidationTypeIdCard,      //校验身份证
    YZKValidationTypeMobile,      //校验手机号
    YZKValidationTypeEmail,       //校验邮箱
};

typedef NS_ENUM (NSInteger, YZKNonEmptyOption) {
    YZKNonEmptyOptionDefault,
    YZKNonEmptyOptionTrimWhitespace, //去除空格
    YZKNonEmptyOptionTrimNewline,    //去除换行符
    YZKNonEmptyOptionTrimWhitespaceAndNewline,
};

@interface NSString (Validation)

/**
 *  字符串格式校验
 *
 *  @param validationType 校验格式类型
 *
 *  @return 是否符合该格式
 */
- (BOOL)verifyWithType:(YZKValidationType)validationType;


/**
 *  字符串非空校验
 *
 *  @param option trim相关字符集
 *
 *  @return 非空 YES，空 NO
 */
- (BOOL)verifyNonEmptyWithOption:(YZKNonEmptyOption)option;

@end
