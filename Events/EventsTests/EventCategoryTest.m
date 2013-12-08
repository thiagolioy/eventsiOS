//
//  EventCategoryTest.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EventCategory.h"

@interface EventCategoryTest : XCTestCase{
    EventCategory *category;
    NSMutableDictionary *dict;
}

@end

@implementation EventCategoryTest

- (void)setUp
{
    [super setUp];
    dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Comedy",@"name",@"1",@"id", nil];
}

- (void)tearDown
{
    category = nil;
    dict = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testShouldCreateEventCategoryFromDict
{
    category = [EventCategory eventCategoryWithDict:dict];
    XCTAssertNotNil(category);
}


- (void)testCreatedCategoryFromDictShouldFieldsWithExpectedValue
{
    category = [EventCategory eventCategoryWithDict:dict];
    
    
    XCTAssertEqualObjects(@"Comedy", category.name);
    XCTAssertEqualObjects(@"1", category.ID);
}
@end
