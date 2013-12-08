//
//  EventCategory.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "EventCategory.h"

@implementation EventCategory


-(id) initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        _name = [dict objectForKey:@"name"];
        _ID = [dict objectForKey:@"id"];
    }
    return self;
}

+(EventCategory*)eventCategoryWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
