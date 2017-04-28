//
//  NSObject+FaultTolerant.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FaultTolerant)

/**
 *  将对象转换为字符串（用于解析容错，nsnull对象）
 *
 *  @return 字符串
 */
- (NSString *)analysisConvertToString;

/**
 *  将对象转换为字典（用于解析容错，nsnull对象）
 *
 *  @return 字典
 */
- (NSMutableDictionary *)analysisConvertToDict;

/**
 *  将对象转换为数组（用于解析容错，nsnull对象)
 *
 *  @return 数组
 */
- (NSMutableArray *)analysisConvertToArray;

@end
