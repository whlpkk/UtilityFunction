//
//  HMACCrypt.h
//  s
//
//  Created by yzk on 15/1/23.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMACCrypt : NSObject

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password;

@end
