//
//  ADBaseAnalyticsViewController.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADBaseAnalyticsViewController.h"

#import "ADAnalyticsInterface.h"

@implementation ADBaseAnalyticsViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self sendAnalyticsPageTag];
}

- (void)sendAnalyticsPageTag {
    [[ADAnalyticsInterface sharedAnalyticsInterface].tagSender sendPageTag:[self analyticsPageName]];
}

/**
 * The analytics reporting suite identifies this screen by the given string
 *
 * @return Page name string
 */
- (NSString *)analyticsPageName {
    
    NSAssert(NO, @"analyticsPageName must return a value in a subclass.");
    return nil;
}

@end
