//
//  ADAnalyticsInterface.h
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnalyticTagSender <NSObject>

@required

/**
 * Initialize the analytics reporting
 */
- (void)configureAnalyticsSuite;

/**
 * Send the analytics suite notics that the app is on a certain page
 *
 * @param pageName  The name of the page
 */
- (void)sendPageTag:(NSString *)pageName;

/**
 * Tell the analytics suite that an event has occured
 *
 * @param eventName Identifier for this event
 */
- (void)sentEventTag:(NSString *)eventName;

@end

/**
 * Singleton through which to send analytics tags to the server. It is
 * agnostic of the analytics provider.
 */
@interface ADAnalyticsInterface : NSObject

+ (instancetype)sharedAnalyticsInterface;

/** Instance of the analytics tag sender that communicates with the server */
@property (nonatomic,strong,readonly)id<AnalyticTagSender> tagSender;

@end
