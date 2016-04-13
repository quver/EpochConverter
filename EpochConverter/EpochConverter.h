//
//  EpochConverter.h
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EpochConverter : NSObject

/**
 *  Time interval since 1970
 */
@property (assign, nonatomic, readonly) NSInteger baseEpoch;

/**
 *  Number of day (Moday = 1, Sunday = 7)
 */
@property (assign, nonatomic, readonly) NSInteger weekDay;

/**
 *  Epoch of Moday in current week - according to base epoch
 */
@property (assign, nonatomic, readonly) NSInteger firstWeekDay;

/**
 *  Epoch of Sunday in current week - according to base epoch
 */
@property (assign, nonatomic, readonly) NSInteger lastWeekDay;

/**
 *  Default init with today date (eg. 1 Januar 2016 00:00:00)
 */
- (instancetype)init;

/**
 *  Init with choosen date
 *
 *  @param epoch Epoch time
 */
- (instancetype)initWithEpoch:(NSInteger)epoch;

/**
 *  You can easily change base epoch by add or subtract days
 *
 *  @param days positive for add, negative for subtract
 */
- (void)changeBaseEpoch:(NSInteger)days;

/**
 *  Number of day (Moday = 1, Sunday = 7)
 *
 *  @param epoch Epoch time
 */
+ (NSInteger)weekDayForEpoch:(NSInteger)epoch;

/**
 *  Epoch of Moday in current week - according to epoch param
 *
 *  @param epoch Epoch time
 */
+ (NSInteger)firstWeekDayForEpoch:(NSInteger)epoch;

/**
 *  Epoch of Sunday in current week - according to epoch param
 *
 *  @param epoch Epoch time
 */
+ (NSInteger)lastWeekDayForEpoch:(NSInteger)epoch;

@end
