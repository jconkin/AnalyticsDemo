//
//  ADBaseAnalyticsViewController.h
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADBaseAnalyticsViewController : UIViewController

/**
 * Tell the analytics suite that the app is on this page
 */
- (void)sendAnalyticsPageTag;

@end
