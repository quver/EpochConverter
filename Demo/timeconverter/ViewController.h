//
//  ViewController.h
//  timeconverter
//
//  Created by Pawel Bednorz on 10.09.2014.
//  Copyright (c) 2014 Quver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *console;
 
- (IBAction)backButton:(id)sender;
- (IBAction)nextButton:(id)sender;

@end
