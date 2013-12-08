//
//  Event.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "Event.h"
#import "NSObject+emptyNullValue.h"

@implementation Event


-(id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        _ID = [self emptyNullValue:[dict objectForKey:@"id"]];
        _country = [self emptyNullValue:[dict objectForKey:@"country_name"]];
        _city = [self emptyNullValue:[dict objectForKey:@"city_name"]];
        _description = [self emptyNullValue:[dict objectForKey:@"description"]];
        _title = [self emptyNullValue:[dict objectForKey:@"title"]];
        
        if([_description isEqualToString:@""])
            _description = @"This event has not description yet.";
    }
    return self;
}

+(Event*)eventWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(NSString *)address{
    return [NSString stringWithFormat:@"%@, %@",_city,_country];
}

+(NSArray*)eventsWithArray:(NSArray*)array{
    NSMutableArray *events = [NSMutableArray array];
    for(NSDictionary *dc in array){
        Event *event = [Event eventWithDict:dc];
        [events addObject:event];
    }
    return [NSArray arrayWithArray:events];
}

@end
