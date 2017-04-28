//
//  WPTappableLabel.h
//  WPAttributedMarkupDemo
//
//  Created by Nigel Grange on 20/10/2014.
//  Copyright (c) 2014 Nigel Grange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZKAttributedStyleAction.h"
#import "NSString+WPAttributedMarkup.h"

/*  eg:
NSDictionary* styleDict = @{@"body":@{ NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue" size:22.0] },
                            @"red": @{ NSFontAttributeName:[UIFont systemFontOfSize:16]
                                       NSForegroundColorAttributeName:[UIColor redColor] }
                            @"help":[YZKAttributedStyleAction styledActionWithAction:^{
                                NSLog(@"Help action");
                            }]};

self.label1.attributedText = [@"Attributed <bold>Bold</bold> <red>Red</red> text" attributedStringWithStyleDict:styleDict];
*/
@interface YZKTappableLabel : UILabel

@end