//
//  NSArray+ContainObject.h
//  s
//
//  Created by yzk on 15/7/9.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ContainObject)

/**
 *  根据object的key-value，查询数组中是否包含object
 *
 *  @param key    object的某个key
 *  @param value  object的key对应的value
 *
 *  @return YES or NO
 */
- (BOOL)containsObjectWithKey:(NSString *)key value:(id)value;

@end
