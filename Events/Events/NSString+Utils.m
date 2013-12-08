//
//  NSString+Utils.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)


-(NSString*)encodeEmptySpaces{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
}
-(NSString*)changeAndSymbol{
    return [self stringByReplacingOccurrencesOfString:@"&amp;" withString:@"and"];
}
-(NSString*)encodeAndToSymbol{
    return [self stringByReplacingOccurrencesOfString:@"and" withString:@"&amp;"];
}

@end
