//
//  APIClient.h
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject

+(void)fetchCategorieOnsuccess:(void (^)(NSArray *categories))success
                     Onfailure:(void (^)(NSString *errorMsg))failure;
@end
