//
//  GDLocalizableController.m
//  s
//
//  Created by yzk on 15/7/22.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "YZKLocalizableManager.h"

@implementation YZKLocalizableManager

static NSBundle *bundle = nil;
static NSString *userLanguage = nil;

+ (void)load {
    [self initUserLanguage];
}

+ (NSBundle *)bundle {
    return bundle;
}

+ (void)initUserLanguage {
    //获取系统当前语言版本
    NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *current = [languages objectAtIndex:0];

    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:current ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];//生成bundle
    
    userLanguage = current;
}

+ (NSString *)userLanguage {
    return userLanguage;
}

+ (void)setUserlanguage:(NSString *)language
{
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];

    userLanguage = language;
}

@end
