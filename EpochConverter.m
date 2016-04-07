//
//  EpochConverter.m
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import "EpochConverter.h"

@implementation EpochConverter

static NSCalendar *calendar;
static NSDateComponents *components;

-(id)init {
    self = [super init];
    if(self) {
        _baseEpoch = [calendar dateFromComponents:components].timeIntervalSince1970;
    }

    return self;
}

-(id)initWithEpoch:(NSInteger)epoch {
    self = [super init];
    if(self) {
        _baseEpoch = epoch;
    }

    return self;
}

- (void)changeBaseEpoch:(NSInteger)days {
    _baseEpoch = self.baseEpoch + (days * 86400);
}

- (NSInteger)weekDay {
    return [EpochConverter weekDayForEpoch:self.baseEpoch];
}

- (NSInteger)firstWeekDay {
    return [EpochConverter firstWeekDayForEpoch:self.baseEpoch];
}

- (NSInteger)lastWeekDay {
    return [EpochConverter lastWeekDayForEpoch:self.baseEpoch];
}

+ (void)initialize {
    calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone timeZoneWithName:@"Europe/Warsaw"];
    calendar.firstWeekday = 2;

    components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                               fromDate:[NSDate date]];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
}

+ (NSInteger)weekDayForEpoch:(NSInteger)epoch {
    return [calendar ordinalityOfUnit:NSCalendarUnitWeekday
                               inUnit:NSCalendarUnitWeekOfYear
                              forDate:[NSDate dateWithTimeIntervalSince1970:epoch]];
}

+ (NSInteger)firstWeekDayForEpoch:(NSInteger)epoch {
    NSInteger firstWeekDayEpoch = epoch - (3600 * 24 * ([self weekDayForEpoch:epoch] - 1));

    return firstWeekDayEpoch;
}

+ (NSInteger)lastWeekDayForEpoch:(NSInteger)epoch {
    NSInteger lastWeekDayEpoch = epoch + (3600 * 24 * (7 - [self weekDayForEpoch:epoch]));

    return lastWeekDayEpoch;
}

@end
