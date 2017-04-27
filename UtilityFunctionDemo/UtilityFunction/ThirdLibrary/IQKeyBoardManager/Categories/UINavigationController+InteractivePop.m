//
//  UINavigationController+InteractivePop.m
//  RongChuang
//
//  Created by cooperlink on 15-5-7.
//  Copyright (c) 2015年 cooperlink. All rights reserved.
//

#import "UINavigationController+InteractivePop.h"

@implementation UINavigationController (InteractivePop)

-(void)interactivePop:(BOOL)isPop respone:(InteractivePopBlock)responseBlock{
    UIPanGestureRecognizer *pan;
    if (isPop) {
        if (responseBlock) {
            
            [self.view addGestureRecognizer:pan];
        }
    }
}

-(void)pop:(InteractivePopBlock)block{
    
}

@end
