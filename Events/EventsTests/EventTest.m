//
//  EventTest.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Event.h"

@interface EventTest : XCTestCase{
    Event *event;
    NSMutableDictionary *firstEventDict;
    NSMutableDictionary *secondEventDict;
    NSMutableArray *eventsArray;
}

@end

@implementation EventTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    firstEventDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"First Event Title",@"title",
                                                                        @"1",@"id",
                                                                        @"United States",@"country_name",
                                                                        @"New York",@"city_name",
                                                                        @"First Event Description",@"description",nil];
    
    secondEventDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Second Event Title",@"title",
                      @"2",@"id",
                      @"United States",@"country_name",
                      @"Los Angeles",@"city_name",
                      @"Second Event Description",@"description",nil];
    
    
    eventsArray = [NSMutableArray array];
    [eventsArray addObject:firstEventDict];
    [eventsArray addObject:secondEventDict];
}

- (void)tearDown
{
    event = nil;
    firstEventDict = nil;
    secondEventDict = nil;
    eventsArray = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


- (void)testShouldHaveExpectedValueIfDescriptionIsNull
{
    [firstEventDict setObject:[NSNull null] forKey:@"description"];
    
    event = [Event eventWithDict:firstEventDict];
    
    XCTAssertEqualObjects(@"This event has not description yet.", event.description);
}

- (void)testShouldHaveExpectedValueIfCountryIsNull
{
    [firstEventDict setObject:[NSNull null] forKey:@"country_name"];
    
    event = [Event eventWithDict:firstEventDict];
    
    XCTAssertEqualObjects(@"", event.country);
}

- (void)testShouldHaveExpectedValueIfCityIsNull
{
    [firstEventDict setObject:[NSNull null] forKey:@"city_name"];
    
    event = [Event eventWithDict:firstEventDict];
    
    XCTAssertEqualObjects(@"", event.city);
}

- (void)testShouldHaveExpectedValueIfTitleIsNull
{
    [firstEventDict setObject:[NSNull null] forKey:@"title"];
    
    event = [Event eventWithDict:firstEventDict];
    
    XCTAssertEqualObjects(@"", event.title);
}
- (void)testShouldHaveExpectedValueIfIDIsNull
{
    [firstEventDict setObject:[NSNull null] forKey:@"id"];
    
    event = [Event eventWithDict:firstEventDict];
    
    XCTAssertEqualObjects(@"", event.ID);
}
- (void)testShouldCreateEventCategoryFromDict
{
    event = [Event eventWithDict:firstEventDict];
    XCTAssertNotNil(event);
}

- (void)testShouldCreateEventCategoriesFromArray
{
    NSArray *events = [Event eventsWithArray:eventsArray];
    
    XCTAssert(events.count == 2);
}

- (void)testShouldHaveExpectedAddressValue
{
    event = [Event eventWithDict:firstEventDict];
    
    
    XCTAssertEqualObjects(@"New York, United States", event.address);
    
}

- (void)testCreatedCategoriesShouldHaveExpectedValuesForFirstCategory
{
    NSArray *events = [Event eventsWithArray:eventsArray];
    event = [events firstObject];
    
    
    XCTAssertEqualObjects(@"First Event Title", event.title);
    XCTAssertEqualObjects(@"United States", event.country);
    XCTAssertEqualObjects(@"New York", event.city);
    XCTAssertEqualObjects(@"First Event Description", event.description);
    XCTAssertEqualObjects(@"1", event.ID);
}


- (void)testCreatedCategoriesShouldHaveExpectedValuesForSecondCategory
{
    NSArray *events = [Event eventsWithArray:eventsArray];
    event = [events lastObject];
    
    
    XCTAssertEqualObjects(@"Second Event Title", event.title);
    XCTAssertEqualObjects(@"United States", event.country);
    XCTAssertEqualObjects(@"Los Angeles", event.city);
    XCTAssertEqualObjects(@"Second Event Description", event.description);
    XCTAssertEqualObjects(@"2", event.ID);
}
- (void)testCreatedCategoryFromDictShouldFieldsWithExpectedValue
{
    event = [Event eventWithDict:firstEventDict];
    
    
    XCTAssertEqualObjects(@"First Event Title", event.title);
    XCTAssertEqualObjects(@"United States", event.country);
    XCTAssertEqualObjects(@"New York", event.city);
    XCTAssertEqualObjects(@"First Event Description", event.description);
    XCTAssertEqualObjects(@"1", event.ID);
}


@end
