//
//  EventCategory.h
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventCategory : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *ID;


+(EventCategory*)eventCategoryWithDict:(NSDictionary*)dict;
@end
