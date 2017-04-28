//
//  NSString+Validation.m
//  RongChuang
//
//  Created by yzk on 15/6/17.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

- (BOOL)verifyWithType:(YZKValidationType)validationType
{
    switch (validationType) {
        case YZKValidationTypeIdCard:
            return [self verifyIdCard];

            break;

        case YZKValidationTypeMobile:
            return [self verifyMobile];

            break;

        case YZKValidationTypeEmail:
            return [self verifyEmail];

        default:
            break;
    }
    return NO;
}

- (BOOL)verifyNonEmptyWithOption:(YZKNonEmptyOption)option
{
    if (self == nil || [self length] == 0) {
        return NO;
    }

    switch (option) {
        case YZKNonEmptyOptionDefault:
            return YES;

            break;

        case YZKNonEmptyOptionTrimWhitespace:
            return !!([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length);

            break;

        case YZKNonEmptyOptionTrimNewline:
            return !!([self stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]].length);

            break;

        case YZKNonEmptyOptionTrimWhitespaceAndNewline:
            return !!([self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length);

            break;

        default:
            break;
    }
    return NO;
}

#pragma mark - private method

- (BOOL)verifyIdCard
{
    NSString *idcard = [self copy];

    if (idcard == nil || idcard.length == 0) {
        return NO;
    }

    idcard = idcard.uppercaseString;

    if (idcard.length == 15) {
        return YES;
    } else if (idcard.length != 18) {
        return NO;
    }

    NSString *verify = [idcard substringFromIndex:17];

    if (![verify isEqualToString:[self getVerify:idcard]]) {
        return NO;
    }

    NSString *regex  = @"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}((19\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|(19\\d{2}(0[13578]|1[02])31)|(19\\d{2}02(0[1-9]|1\\d|2[0-8]))|(19([13579][26]|[2468][048]|0[48])0229))\\d{3}(\\d|X|x)?$";
    NSPredicate *pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

    if (![pred evaluateWithObject:idcard]) {
        return false;
    }

    return true;
}

static int wi[] = {
    7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1
};
static int vi[] = {
    1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2
};
- (NSString *)getVerify:(NSString *)eightcardid
{
    int remaining = 0;
    int ai[18];

    if (eightcardid.length == 18) {
        NSRange range;
        range.location = 0;
        range.length = 17;
        eightcardid = [eightcardid substringWithRange:range];
    }

    if (eightcardid.length == 17) {
        int sum = 0;

        for (int i = 0; i < 17; i++) {
            //				String k = eightcardid.substring(i, i + 1);
            char k = [eightcardid characterAtIndex:i];
            ai[i] = (int)(k - '0');
        }

        for (int i = 0; i < 17; i++) {
            sum = sum + wi[i] * ai[i];
        }

        remaining = sum % 11;
    }

    return remaining == 2 ? @"X" : [NSString stringWithFormat:@"%d", vi[remaining]];
}

- (BOOL)verifyMobile
{
    NSString *express = @"^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF matches %@", express];

    return [pred evaluateWithObject:self];
}

- (BOOL)verifyEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    return [emailTest evaluateWithObject:self];
}

@end
