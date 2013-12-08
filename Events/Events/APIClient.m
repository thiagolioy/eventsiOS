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
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "EventCategory.h"
#import "Keys.h"

#define SERVER_ERROR 500

#define BASE_URL @"http://api.eventful.com/json/"
#define CATEGORIES_URL @"categories/list?app_key=%@"

@interface APIClient (){
   AFHTTPRequestOperationManager *manager;
}

-(void)handleErrors:(AFHTTPRequestOperation*)operation;
-(void)configureAPIClient;
-(void)configureRequestOperationManager;
-(void)configureReachability;
@end


static APIClient *instance;

@implementation APIClient


+(APIClient*)shareClient{
    if(!instance){
        instance = [[APIClient alloc] init];
        [instance configureAPIClient];
     }
    return  instance;
}


#pragma mark - Configuration Methods
-(void)configureAPIClient{
    [self configureRequestOperationManager];
    [self configureReachability];
}

-(void)configureReachability{
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
}

-(void)configureRequestOperationManager{
    AFNetworkActivityIndicatorManager.sharedManager.enabled = YES;
    NSURL *baseURL = [NSURL URLWithString:BASE_URL];
    manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
}


#pragma mark - Request Methods
-(void)fetchCategorieOnsuccess:(void (^)(NSArray *categories))success
                 Onfailure:(void (^)(void))failure{
    
    [manager GET:[NSString stringWithFormat:CATEGORIES_URL,APP_KEY] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *categories = [EventCategory eventCategoriesWithArray:[responseObject objectForKey:@"category"]];
        success(categories);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
        [self handleErrors:operation];
        failure();
    
    }];
}


#pragma mark - Handler Methods
-(void)handleErrors:(AFHTTPRequestOperation*)operation{
    
    NSString *errorMsg;
    if(operation.response == nil)
        errorMsg = @"We had a problem trying to fetch the data";
    else if(operation.response.statusCode == SERVER_ERROR)
        errorMsg = @"Server Error";
    
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:errorMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil] show];
    
}

@end
