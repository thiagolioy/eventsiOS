//
//  EventCategory.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "EventCategory.h"
#import "NSObject+emptyNullValue.h"

@implementation EventCategory


-(id) initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        _name = [self emptyNullValue:[dict objectForKey:@"name"]];
        _ID = [self emptyNullValue:[dict objectForKey:@"id"]];
    }
    return self;
}

+(EventCategory*)eventCategoryWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+(NSArray*)eventCategoriesWithArray:(NSArray*)array{
    NSMutableArray *categories = [NSMutableArray array];
    for(NSDictionary *dc in array){
        EventCategory *category = [EventCategory eventCategoryWithDict:dc];
        [categories addObject:category];
    }
    return [NSArray arrayWithArray:categories];
}
@end
