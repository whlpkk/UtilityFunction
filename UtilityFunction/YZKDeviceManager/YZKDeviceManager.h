//
//  YZKDeviceManager.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKDeviceManager : NSObject

/**
 *  获取当前设备的设备号（即唯一标识符）
 *
 *  @return 唯一标示符
 */
+ (NSString *)equipment;

/**
 *  判断设备型号
 *
 *  @return 设备型号
 */
+ (NSString *)deviceString;


@end
