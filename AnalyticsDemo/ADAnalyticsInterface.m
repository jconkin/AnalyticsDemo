//
//  ADAnalyticsInterface.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADAnalyticsInterface.h"

#import "ADGoogleAnalyticsInterface.h"
#import "ADSiteCatalystAnalyticsInterface.h"

@interface ADAnalyticsInterface ()

/** Property is writeable at private scope */
@property (nonatomic,strong)id<AnalyticTagSender> tagSender;

@end

@implementation ADAnalyticsInterface

#pragma mark - Singleton creation

/**
 * The singleton instance. Only publicly accessible via
 * sharedAnalyticsInterface method
 */
static ADAnalyticsInterface *sharedAnalyticsInterfaceInstance = nil;

/** 
 * Return the shared instance. Create it if it doesn't exist.
 *
* @return The singleton instance
 */
+ (instancetype)sharedAnalyticsInterface {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        sharedAnalyticsInterfaceInstance = [[ADAnalyticsInterface alloc] init];
        sharedAnalyticsInterfaceInstance.tagSender = [ADSiteCatalystAnalyticsInterface new];//TODO: Switch to interface of your choosing
        [sharedAnalyticsInterfaceInstance.tagSender configureAnalyticsSuite];
    });
    
    return sharedAnalyticsInterfaceInstance;
}

+ (id)alloc {
    NSAssert((sharedAnalyticsInterfaceInstance == nil), @"Analytics interface should only be accessed via sharedAnalyticsInterface.");
    return [super alloc];
}

+ (id)allocWithZone:(NSZone *)zone {
    NSAssert((sharedAnalyticsInterfaceInstance == nil), @"Analytics interface should only be accessed via sharedAnalyticsInterface.");
    return [super allocWithZone:zone];
}

- (id) copyWithZone:(NSZone *)paramZone {
    return self;
}

@end
