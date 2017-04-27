//
//  UINavigationController+InteractivePop.h
//  RongChuang
//
//  Created by cooperlink on 15-5-7.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^InteractivePopBlock) ();
@interface UINavigationController (InteractivePop)

-(void)interactivePop:(BOOL)isPop respone:(InteractivePopBlock)responseBlock;

@end
