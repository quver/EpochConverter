//
//  EpochConverter.h
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EpochConverter : NSObject

@property (assign, nonatomic, readonly) NSInteger baseEpoch;
@property (assign, nonatomic, readonly) NSInteger weekDay;
@property (assign, nonatomic, readonly) NSInteger firstWeekDay;
@property (assign, nonatomic, readonly) NSInteger lastWeekDay;

- (instancetype)init;
- (instancetype)initWithEpoch:(NSInteger)epoch;
- (void)changeBaseEpoch:(NSInteger)days;

+ (NSInteger)firstWeekDayForEpoch:(NSInteger)epoch;
+ (NSInteger)lastWeekDayForEpoch:(NSInteger)epoch;
+ (NSInteger)weekDayForEpoch:(NSInteger)epoch;

@end
