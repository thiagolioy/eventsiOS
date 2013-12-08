//
//  NSStringUtilsCategoryTest.m
//  Events
//
//  Created by Thiago Lioy on 12/8/13.
//  Copyright (c) 2013 Thiago Lioy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Utils.h"

@interface NSStringUtilsCategoryTest : XCTestCase

@end

@implementation NSStringUtilsCategoryTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testShouldEncodeEmptySpaces
{
    NSString *expec = @"Conferences%20&amp;%20Tradeshows";
    NSString *actual = @"Conferences &amp; Tradeshows";
    
    XCTAssertEqualObjects(expec, [actual encodeEmptySpaces]);
}
- (void)testShouldChangeAndSymbol
{
    NSString *expec = @"Conferences and Tradeshows";
    NSString *actual = @"Conferences &amp; Tradeshows";
    
    
    XCTAssertEqualObjects(expec, [actual changeAndSymbol]);
}

- (void)testShouldEncodeAndToSymbol
{
    NSString *expec = @"Conferences &amp; Tradeshows";
    NSString *actual = @"Conferences and Tradeshows";
    
    
    XCTAssertEqualObjects(expec, [actual encodeAndToSymbol]);
}
@end
