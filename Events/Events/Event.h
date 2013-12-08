//
//  Event.h
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property(nonatomic,strong) NSString *country;
@property(nonatomic,strong) NSString *city;
@property(nonatomic,strong) NSString *description;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *ID;

+(Event*)eventWithDict:(NSDictionary*)dict;

@end
