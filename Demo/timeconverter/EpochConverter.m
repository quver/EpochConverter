//
//  EpochConverter.m
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import "EpochConverter.h"

@implementation EpochConverter

-(id)init {
    self = [super init];
    if(self)
    {
        _baseEpoch = (int)[[NSDate date] timeIntervalSince1970];
        return self;
    }
    return nil;
}

-(id)initWithEpoch:(int)epoch {
    self = [super init];
    if(self)
    {
        _baseEpoch = epoch;
        return self;
    }
    return nil;
}

- (int)weekDayForEpoch:(int)epoch {
    
    if (epoch == 0) {
        epoch = _baseEpoch;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setFirstWeekday:2];
    return (int)[calendar ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:[NSDate dateWithTimeIntervalSince1970:epoch]];
}

- (NSString *)dateStringForEpoch:(int)epoch {
    
    if (epoch == 0) {
        epoch = _baseEpoch;
    }
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Europe/Warsaw"];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"pl"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"EEEE - dd LLLL YYYY"];
    [dateFormatter setTimeZone:timeZone];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:epoch];
    
    return [dateFormatter stringFromDate:date];
}

- (int)firstWeekDay:(int)epoch {
    
    if (epoch == 0) {
        epoch = _baseEpoch;
    }
    
    return epoch - (3600 * 24 * ([self weekDayForEpoch:epoch] - 1));
}

- (int)lastWeekDay:(int)epoch {
    
    if (epoch == 0) {
        epoch = _baseEpoch;
    }
    
    return epoch + (3600 * 24 * (7 - [self weekDayForEpoch:epoch]));
}

- (void)changeBaseEpoch:(int)days {
    _baseEpoch = _baseEpoch + (days * 86400);
}

@end
