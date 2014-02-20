//
//  ADSiteCatalystAnalyticsInterface.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADSiteCatalystAnalyticsInterface.h"

#import "ADMS_Measurement.h"
#import "ADMS_MediaMeasurement.h"

static NSString *rsid = @"analyticsDemo";

@implementation ADSiteCatalystAnalyticsInterface

#pragma mark - AnalyticTagSender

- (void)configureAnalyticsSuite {
    
    ADMS_Measurement *measurement = [ADMS_Measurement sharedInstance];
    
    measurement.ssl = NO; //Set NO for blood hound
    measurement.debugLogging = YES; // Enable Debugging
}

- (void)sendPageTag:(NSString *)pageName {
    
    ADMS_Measurement *measure = [ADMS_Measurement sharedInstance];
    [measure configureMeasurementWithReportSuiteIDs:rsid
                                     trackingServer:[ADSiteCatalystAnalyticsInterface getTrackingServer]];
    [measure clearVars];
    [measure trackAppState:pageName
           withContextData:[ADSiteCatalystAnalyticsInterface createContextData]];
}

- (void)sentEventTag:(NSString *)eventName {
    
    ADMS_Measurement *measurement = [ADMS_Measurement sharedInstance];
    
	[measurement trackEvents:eventName withContextData:[ADSiteCatalystAnalyticsInterface createContextData]];
}

/**
 * The tracking server is a string for a URI
 *
 * @return server:port
 */
+ (NSString *)getTrackingServer
{
    NSString *server = @"127.0.0.1";//TODO: Provide your own ip
    NSString *port = @"49973";//TODO: Provide your own port
    NSString *trackingServer = [NSString stringWithFormat:@"%@:%@", server, port];
    
    return trackingServer;
}

/**
 * Create an array of data that is sent on every analytics hit
 *
 * @return Generated dictionary
 */
+ (NSMutableDictionary *)createContextData {
    
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
	[contextData setObject:@"value" forKey:@"contextKey"];
    
    // App name
    [contextData setObject:@"Analytics Demo iPhone" forKey:@"my.eVar56"];
    
    // Customer id
    NSString *customerIDString = @"Test User";
    if (customerIDString) {
        [contextData setObject:customerIDString forKey:@"my.prop15"];
        [contextData setObject:customerIDString forKey:@"my.eVar15"];
    }
    
    // Build id
    NSString *buildID = @"1.0";
    [contextData setObject:buildID forKey:@"my.prop48"];
    [contextData setObject:buildID forKey:@"my.eVar48"];
	[contextData setObject:@"value" forKey:@"contextKey"];
	
    // RSID
    [contextData setObject:rsid forKey:@"my.prop26"];
    
    return contextData;
}
@end
