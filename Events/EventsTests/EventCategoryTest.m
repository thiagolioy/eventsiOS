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
    NSMutableDictionary *firstCategoryDict;
    NSMutableDictionary *secondCategoryDict;
    NSMutableArray *categoriesArray;
}

@end

@implementation EventCategoryTest

- (void)setUp
{
    [super setUp];
    firstCategoryDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Comedy",@"name",@"1",@"id", nil];
    secondCategoryDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Movies",@"name",@"2",@"id", nil];
    
    categoriesArray = [NSMutableArray array];
    [categoriesArray addObject:firstCategoryDict];
    [categoriesArray addObject:secondCategoryDict];
}

- (void)tearDown
{
    category = nil;
    firstCategoryDict = nil;
    secondCategoryDict = nil;
    categoriesArray = nil;
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testShouldCreateEventCategoryFromDict
{
    category = [EventCategory eventCategoryWithDict:firstCategoryDict];
    XCTAssertNotNil(category);
}


- (void)testShouldHaveExpectedValueIfNameIsNull
{
    [firstCategoryDict setObject:[NSNull null] forKey:@"name"];
    
    category = [EventCategory eventCategoryWithDict:firstCategoryDict];
    
    XCTAssertEqualObjects(@"", category.name);
}


- (void)testShouldHaveExpectedValueIfIDIsNull
{
    [firstCategoryDict setObject:[NSNull null] forKey:@"id"];
    
    category = [EventCategory eventCategoryWithDict:firstCategoryDict];
    
    XCTAssertEqualObjects(@"", category.ID);
}

- (void)testShouldCreateEventCategoriesFromArray
{
    NSArray *categories = [EventCategory eventCategoriesWithArray:categoriesArray];
    
    XCTAssert(categories.count == 2);
}

- (void)testCreatedCategoriesShouldHaveExpectedValuesForFirstCategory
{
    NSArray *categories = [EventCategory eventCategoriesWithArray:categoriesArray];
    category = [categories firstObject];
    
    XCTAssertEqualObjects(@"Comedy", category.name);
    XCTAssertEqualObjects(@"1", category.ID);
}


- (void)testCreatedCategoriesShouldHaveExpectedValuesForSecondCategory
{
    NSArray *categories = [EventCategory eventCategoriesWithArray:categoriesArray];
    category = [categories lastObject];
    
    XCTAssertEqualObjects(@"Movies", category.name);
    XCTAssertEqualObjects(@"2", category.ID);
}
- (void)testCreatedCategoryFromDictShouldFieldsWithExpectedValue
{
    category = [EventCategory eventCategoryWithDict:firstCategoryDict];
    
    
    XCTAssertEqualObjects(@"Comedy", category.name);
    XCTAssertEqualObjects(@"1", category.ID);
}

@end
