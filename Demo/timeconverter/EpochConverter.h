//
//  EpochConverter.h
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EpochConverter : NSObject

@property (assign, readonly) int baseEpoch;

-(id)initWithEpoch:(int)epoch;
- (int)weekDayForEpoch:(int)epoch;
- (NSString *)dateStringForEpoch:(int)timestamp;
- (int)firstWeekDay:(int)epoch;
- (int)lastWeekDay:(int)epoch;
- (void)changeBaseEpoch:(int)days;
@end
