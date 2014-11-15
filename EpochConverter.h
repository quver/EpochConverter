//
//  EpochConverter.h
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EpochConverter : NSObject

@property (strong, nonatomic, readonly) NSNumber * baseEpoch;

- (id)initWithEpoch:(NSInteger)epoch;
- (NSNumber *)firstWeekDay:(NSNumber *)epoch;
- (NSNumber *)lastWeekDay:(NSNumber *)epoch;
- (void)changeBaseEpoch:(NSInteger)days;
@end
