//
//  UILabel+GetTextSize.h
//  s
//
//  Created by yzk on 15/6/18.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (GetTextSize)

/**
 *  根据Label的Bound和Font，算出text的 width 和 height
 *
 *  @return width or height
 */
- (double)getTextWidth;
- (double)getTextHeight;

/**
 *  根据Label的Bound和attributes，算出text的 width 和 height
 *
 *  @param attributes label的attributes
 *
 *  @return width or height
 */
- (double)getAttributedTextWidthWithAttributes:(NSDictionary *)attributes;
- (double)getAttributedTextHeightWithAttributes:(NSDictionary *)attributes;

@end
