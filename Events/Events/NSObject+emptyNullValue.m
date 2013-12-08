//
//  NSObject+emptyNullValue.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "NSObject+emptyNullValue.h"

@implementation NSObject (emptyNullValue)


-(NSString*)emptyNullValue:(NSString*)value{
    return  ((NSNull *) value != [NSNull null]) ? value: @"";
}
@end
