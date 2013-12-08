//
//  APIClient.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

#import "Keys.h"


#define CATEGORIES_URL @"http://api.eventful.com/json/categories/list?app_key=%@"

@implementation APIClient


+(void)fetchCategorieOnsuccess:(void (^)(NSArray *categories))success
                 Onfailure:(void (^)(NSString *errorMsg))failure{
    AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:CATEGORIES_URL,APP_KEY] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *categories;
        
        success(categories);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSString *errorMsg;
        
        failure(errorMsg);
        
    }];
}

@end
