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

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//extern NSString * const kTypeFade;
//extern NSString * const kTypeMoveIn;
//extern NSString * const kTypePush;
//extern NSString * const kTypeReveal;
//
//extern NSString * const kTypeCube;
//extern NSString * const kTypeSuckEffect;
//extern NSString * const kTypeRippleEffect;
//extern NSString * const kTypeOglFlip;
//
//extern NSString * const kTypePageCurl;
//extern NSString * const kTypePageUnCurl;
//extern NSString * const kTypeCameraIrisHollowOpen;
//extern NSString * const kTypeCameraIrisHollowClose;


/**
 *  修改push和pop动画
 */
@interface UINavigationController (BATransitions)

/**
 *  修改navigationBar的push动画
 *
 *  @param controller 被push的viewController
 *  @param transition 动画类型
 */
- (void)pushViewController:(UIViewController *)controller
            withTransition:(UIViewAnimationTransition)transition;

/**
 *  修改navigationBar的pop动画
 *
 *  @param transition 动画类型
 *
 *  @return 被pup的viewController
 */
- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end
