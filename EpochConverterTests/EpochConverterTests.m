//
//  EpochConverterTests.m
//  EpochConverterTests
//
//  Created by Pawel Bednorz on 06.04.2016.
//  Copyright © 2016 Quver.xyz. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "EpochConverter.h"

@interface EpochConverterTests : XCTestCase
@property (strong, nonatomic) EpochConverter *converter;
@end

@implementation EpochConverterTests

//28 December 2015 00:00:00 CET
NSInteger tweentyEightDecember2015 = 1451257200;

// 1 Januar 2016 00:00:00 CET
NSInteger firstJanuar2016 = 1451602800;

//3 Januar 2015 00:00:00 CET
NSInteger thirdJanuar2016 = 1451775600;

- (void)setUp {
    [super setUp];

    self.converter = [[EpochConverter alloc] initWithEpoch:firstJanuar2016];
}

- (void)tearDown {
    self.converter = nil;
    [super tearDown];
}

- (void)testInitWithEpoch {
    XCTAssertEqual(self.converter.baseEpoch, firstJanuar2016);
}

- (void)testInit {
    EpochConverter *newConverter = [[EpochConverter alloc] init];

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"Europe/Warsaw"];
    
    NSDateComponents *componets = [calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond
                                              fromDate:[NSDate dateWithTimeIntervalSince1970:newConverter.baseEpoch]];

    XCTAssertEqual(componets.hour, 0);
    XCTAssertEqual(componets.minute, 0);
    XCTAssertEqual(componets.second, 0);
}

- (void)testFirstWeekDay {
    XCTAssertEqual(self.converter.firstWeekDay, tweentyEightDecember2015);
}

- (void)testLastWeekDay {
    XCTAssertEqual(self.converter.lastWeekDay, thirdJanuar2016);
}

- (void)testWeekDay {
    XCTAssertEqual(self.converter.weekDay, 5);
}

- (void)testChangeBaseEpoch {
    [self.converter changeBaseEpoch:2];

    XCTAssertEqual(self.converter.baseEpoch, thirdJanuar2016);
    XCTAssertEqual(self.converter.firstWeekDay, tweentyEightDecember2015);
    XCTAssertEqual(self.converter.lastWeekDay, thirdJanuar2016);
    XCTAssertEqual(self.converter.weekDay, 7);
}

@end
