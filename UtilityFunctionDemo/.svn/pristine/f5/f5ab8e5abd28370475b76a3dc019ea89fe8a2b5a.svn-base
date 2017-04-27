//
//  HMACCrypt.m
//  s
//
//  Created by yzk on 15/1/23.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "HMACCrypt.h"
#import "NSData+CommonCrypto.h"
#import "GTMBase64.h"

@implementation HMACCrypt

+ (NSString *)encrypt:(NSString *)message password:(NSString *)password
{
    NSData *encryptedData = [[message dataUsingEncoding:NSUTF8StringEncoding] HMACAlgSHA256WithKey:password];

    //把data转成string
    NSString *byteString = [self dataByteString:encryptedData];
    NSData *base64Data = [byteString dataUsingEncoding:NSUTF8StringEncoding];

    //将string Base64加密
    return [GTMBase64 stringByWebSafeEncodingData:base64Data padded:NO];
}

+ (NSString *)dataByteString:(NSData *)data
{
    NSMutableString *output = [NSMutableString string];

    for (int i = 0; i < data.length; i++) {
        [output appendFormat:@"%02x", ((unsigned char *)[data bytes])[i]];
    }

    return output;
}

@end
