//
//  ViewController.m
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import "ViewController.h"
#import "EpochConverter.h"

@interface ViewController () {
    EpochConverter *converter;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //MOTD text
    [self.console setText:@"Console"];
    
    //Style sheet
    [self.console setTextColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:1]];
    [self.console setBackgroundColor:[UIColor blackColor]];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    //Init timestamp
    converter = [[EpochConverter alloc] init];
    
    [self dumper];
}

- (void)printLog:(NSString *)toLog {
    [self.console setText:[NSString stringWithFormat:@"%@ \n%@", self.console.text, toLog]];
    [self.console scrollRangeToVisible:NSMakeRange([self.console.text length], 0)];
}

- (void)dumper {
    //Methods dump
    NSString *dateString = [converter dateStringForEpoch:0];
    int weekDay = [converter weekDayForEpoch:0];
    
    //Weekday counter
    int weekStartTimestamp = [converter firstWeekDay:0];
    int weekEndTimestamp = [converter lastWeekDay:0];
    
    //PrintOut
    [self printLog:[NSString stringWithFormat:@"Current timestamp %i", converter.baseEpoch]];
    [self printLog:[NSString stringWithFormat:@"Current human date %@", dateString]];
    
    [self printLog:[NSString stringWithFormat:@"Current weekday %i", weekDay]];
    
    [self printLog:[NSString stringWithFormat:@"Monday %@", [converter dateStringForEpoch:weekStartTimestamp]]];
    [self printLog:[NSString stringWithFormat:@"Sunday %@", [converter dateStringForEpoch:weekEndTimestamp]]];
}


- (IBAction)backButton:(id)sender {
    [converter changeBaseEpoch:-7];
    [self printLog:@"-------------------------"];
    [self dumper];
}

- (IBAction)nextButton:(id)sender {
    [converter changeBaseEpoch:7];
    [self printLog:@"-------------------------"];
    [self dumper];
}
@end
