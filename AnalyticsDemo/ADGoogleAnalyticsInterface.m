//
//  ADGoogleAnalyticsInterface.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADGoogleAnalyticsInterface.h"

#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAITracker.h"
#import "GAIFields.h"

@implementation ADGoogleAnalyticsInterface

#pragma mark - AnalyticTagSender

- (void)configureAnalyticsSuite {
    
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-XXXXX-Y"];//TODO: Provide your own google analytics id
}

- (void)sendPageTag:(NSString *)pageName {
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id<GAITracker> tracker =[[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName
           value:pageName];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)sentEventTag:(NSString *)eventName {

    id<GAITracker> tracker =[[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"play"          // Event label
                                                           value:nil] build]];    // Event value
}
@end
