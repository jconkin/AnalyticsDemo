//
//  ADSecondViewController.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADSecondViewController.h"

#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAITracker.h"
#import "ADAnalyticsInterface.h"

@implementation ADSecondViewController

- (NSString *)analyticsPageName {
    return @"Purple page";
}

/**
 * The button to send an analytics tag was tapped
 *
 * @param sender    Object that sent the event
 */
- (IBAction)eventButtonTapped:(id)sender {
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"action button tapped"  // Event label
                                                           value:nil] build]];    // Event value
    

    [[ADAnalyticsInterface sharedAnalyticsInterface].tagSender sentEventTag:@"action button tapped"];
}

@end
