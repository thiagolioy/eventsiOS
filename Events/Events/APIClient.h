//
//  APIClient.h
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject

+(APIClient*)shareClient;

-(void)fetchCategoriesOnsuccess:(void (^)(NSArray *categories))success
                     Onfailure:(void (^)(void))failure;

-(void)fetchEventsForCategoryName:(NSString*)name withPageNumber:(NSUInteger)pageNumber andPageSize:(NSUInteger)pageSize
                        onSuccess:(void (^)(NSArray *events,NSUInteger totalEventsCount))success
                      onFailure:(void (^)(void))failure;


@end
