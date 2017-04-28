//
//  GDLocalizableController.h
//  s
//
//  Created by yzk on 15/7/22.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

// ----- 多语言设置
#define CHINESE @"zh-Hans"
#define ENGLISH @"en"

#define YZKLocalizedString(key) \
    [[YZKLocalizableManager bundle] localizedStringForKey: (key)value: @"" table: nil]
#define YZKLocalizedStringFromTable(key, tbl) \
    [[YZKLocalizableManager bundle] localizedStringForKey: (key)value: @"" table: (tbl)]


@interface YZKLocalizableManager : NSObject

+ (NSBundle *)bundle;    //获取当前资源文件
+ (void)initUserLanguage;//初始化语言文件,默认为系统设置语言

+ (NSString *)userLanguage;                  //获取应用当前语言
+ (void)setUserlanguage:(NSString *)language;//设置应用当前语言

@end
