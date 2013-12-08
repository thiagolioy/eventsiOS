//
//  Event.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "Event.h"

@implementation Event


-(id)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        _ID = [dict objectForKey:@"id"];
        _country = [dict objectForKey:@"country_name"];
        _city = [dict objectForKey:@"city_name"];
        _description = [dict objectForKey:@"description"];
        _title = [dict objectForKey:@"title"];
    }
    return self;
}

+(Event*)eventWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

//+(NSArray*)eventCategoriesWithArray:(NSArray*)array{
//    NSMutableArray *categories = [NSMutableArray array];
//    for(NSDictionary *dc in array){
//        EventCategory *category = [EventCategory eventCategoryWithDict:dc];
//        [categories addObject:category];
//    }
//    return [NSArray arrayWithArray:categories];
//}

@end
