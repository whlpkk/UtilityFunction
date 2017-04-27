/*
   Copyright 2011 Dmitry Stadnik. All rights reserved.

   Redistribution and use in source and binary forms, with or without modification, are
   permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
   conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
   of conditions and the following disclaimer in the documentation and/or other materials
   provided with the distribution.

   THIS SOFTWARE IS PROVIDED BY DMITRY STADNIK ``AS IS'' AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
   FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL DMITRY STADNIK OR
   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
   ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

   The views and conclusions contained in the software and documentation are those of the
   authors and should not be interpreted as representing official policies, either expressed
   or implied, of Dmitry Stadnik.
 */

#import "UINavigationController+BATransitions.h"
#import <QuartzCore/QuartzCore.h>

//NSString * const kTypeFade = kCATransitionFade;
//NSString * const kTypeMoveIn = kCATransitionMoveIn;
//NSString * const kTypePush = kCATransitionPush;
//NSString * const kTypeReveal = kCATransitionReveal ;
//
//NSString * const kTypeCube = @"cube";
//NSString * const kTypeSuckEffect = @"suckEffect";
//NSString * const kTypeRippleEffect = @"rippleEffect";
//NSString * const kTypeOglFlip = @"oglFlip";
//
//NSString * const kTypePageCurl = @"pageCurl";
//NSString * const kTypePageUnCurl = @"pageUnCurl";
//NSString * const kTypeCameraIrisHollowOpen = @"cameraIrisHollowOpen";
//NSString * const kTypeCameraIrisHollowClose = @"cameraIrisHollowClose";


@implementation UINavigationController (BATransitions)

- (void)pushViewController:(UIViewController *)controller
            withTransition:(UIViewAnimationTransition)transition
{
    [self pushViewController:controller animated:NO];

    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.25;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = kCATransitionFade;
    [[self.view layer] addAnimation:animation forKey:@"animation"];
//    [UIView beginAnimations:nil context:NULL];
//    [self pushViewController:controller animated:NO];
//    [UIView setAnimationDuration:0.25];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationTransition:transition forView:self.view cache:YES];
//    [UIView commitAnimations];
}

- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition
{
    [UIView beginAnimations:nil context:NULL];
    UIViewController *controller = [self popViewControllerAnimated:NO];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
    return controller;
}

@end
