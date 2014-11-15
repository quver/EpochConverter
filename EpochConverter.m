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
        NSCalendar* myCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        [myCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"Europe/Warsaw"]];
        
        NSDateComponents* components = [myCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                                     fromDate:[NSDate date]];
        [components setHour: 0];
        [components setMinute: 0];
        [components setSecond: 0];
        
        NSLog(@"[[myCalendar dateFromComponents:components] timeIntervalSince1970] %f", [[myCalendar dateFromComponents:components] timeIntervalSince1970]);
        
        _baseEpoch = [NSNumber numberWithInteger:[[myCalendar dateFromComponents:components] timeIntervalSince1970]];
        
        return self;
    }
    return nil;
}

-(id)initWithEpoch:(NSInteger)epoch {
    self = [super init];
    if(self)
    {
        _baseEpoch = [NSNumber numberWithInteger:epoch];
        return self;
    }
    return nil;
}

- (NSInteger)weekDayForEpoch:(NSNumber *)epoch {
    
    if (epoch == nil) {
        epoch = _baseEpoch;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [calendar setFirstWeekday:2];
    return [calendar ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:[NSDate dateWithTimeIntervalSince1970:epoch.doubleValue]];
}

//- (NSString *)dateStringForEpoch:(NSInteger)epoch {
//    
//    if (epoch == 0) {
//        epoch = (NSInteger)_baseEpoch;
//    }
//    
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Europe/Warsaw"];
//    NSDateFormatter *dateFormatter = [NSDateFormatter new];
//    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"pl"];
//    [dateFormatter setLocale:locale];
//    [dateFormatter setDateFormat:@"EEEE - dd LLLL YYYY"];
//    [dateFormatter setTimeZone:timeZone];
//    
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:epoch];
//    
//    return (NSString *)[dateFormatter stringFromDate:date];
//}

- (NSNumber *)firstWeekDay:(NSNumber *)epoch {
    
    if (epoch == nil) {
        epoch = _baseEpoch;
    }
    
    NSInteger firstWeekDayEpoch = epoch.integerValue - (3600 * 24 * ([self weekDayForEpoch:epoch] - 1));
    
    return [NSNumber numberWithInteger:firstWeekDayEpoch];
}

- (NSNumber *)lastWeekDay:(NSNumber *)epoch {
    
    if (epoch == nil) {
        epoch = _baseEpoch;
    }
    
    NSInteger lastWeekDayEpoch = epoch.integerValue + (3600 * 24 * (7 - [self weekDayForEpoch:epoch]));
    
    return [NSNumber numberWithInteger:lastWeekDayEpoch];
}

- (void)changeBaseEpoch:(NSInteger)days {
    NSInteger newBaseEpoch = (NSInteger)_baseEpoch + (days * 86400);
    _baseEpoch = [NSNumber numberWithInteger:newBaseEpoch];
}

@end
