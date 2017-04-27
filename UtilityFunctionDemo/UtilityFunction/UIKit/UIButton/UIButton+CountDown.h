//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

/**
 *  倒计时button
 *
 *  @param timeout    倒计时时间
 *  @param tittle     结束后button的title
 *  @param waitTittle block，返回计时过程中的title
 */
- (void)startTime:(NSInteger)timeout
            title:(NSString *)tittle
       waitTittle:(NSString *(^)(NSInteger time))waitTittle;

@end
