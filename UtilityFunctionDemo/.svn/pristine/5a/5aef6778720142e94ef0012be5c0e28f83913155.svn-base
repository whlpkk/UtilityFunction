//
//  RIButtonItem.h
//  Shibui
//
//  Created by Jiva DeVoe on 1/12/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

typedef enum {
    RIButtonItemType_Other          = 0,  //by Default
    RIButtonItemType_Cancel            ,
    RIButtonItemType_Destructive
}RIButtonItemType;

#import <Foundation/Foundation.h>

@interface RIButtonItem : NSObject
{
    NSString *label;
    void (^action)();
}

@property (retain, nonatomic) NSString *label;
@property (assign, nonatomic) RIButtonItemType type;
@property (copy, nonatomic) void (^action)();

+ (id)item;

+ (id)itemWithLabel:(NSString *)inLabel;

+ (id)itemWithLabel:(NSString *)inLabel
             action:(void(^)(void))action;

+ (id)itemWithLabel:(NSString *)inLabel
               type:(RIButtonItemType)type
             action:(void(^)(void))action;

@end

