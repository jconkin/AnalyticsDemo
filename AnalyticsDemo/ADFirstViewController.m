//
//  ADFirstViewController.m
//  AnalyticsDemo
//
//  Created by Jeremy Conkin on 2/19/14.
//  Copyright (c) 2014 Jeremy Conkin. All rights reserved.
//

#import "ADFirstViewController.h"

/**
 * Identifiers for the segmented control indices. Changing the order here will
 * reorder the segmented control.
 */
typedef enum {
    COLOR_RED,
    COLOR_GREEN,
    COLOR_BLUE,
    COLOR_MAX
}ViewControllerColors;

@interface ADFirstViewController ()

/**
 * Background color changes based on selected segment. Number of segments and
 * title of segments is determined in code
 */
@property (nonatomic,weak) IBOutlet UISegmentedControl *segmentedControl;

/** Label text differs based on selected segment */
@property (nonatomic,weak) IBOutlet UILabel *statusLabel;

@end

@implementation ADFirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Create the segments for the segmented control
    [self.segmentedControl removeAllSegments];
    for (ViewControllerColors currentColorIndex = 0; currentColorIndex < COLOR_MAX; ++currentColorIndex) {
        [self.segmentedControl insertSegmentWithTitle:[self titleForColorIndex:currentColorIndex]
                                              atIndex:currentColorIndex
                                             animated:NO];
    }
    
    // Listen for tap events
    [self.segmentedControl addTarget:self
                              action:@selector(segementChanged)
                    forControlEvents:UIControlEventValueChanged];
    
    [self updateBackgroundForSelectedSegment];
    [self updateStatusLabel];
}

/**
 * The selected value in the segmented control changed
 */
- (void)segementChanged {
    
    [self updateBackgroundForSelectedSegment];
    [self sendAnalyticsPageTag];
    [self updateStatusLabel];
}

/**
 * Status label text reflects the analytics page name
 */
- (void)updateStatusLabel {
    self.statusLabel.text = [self analyticsPageName];
}

/**
 * Change the background color based on which segment was selected
 */
- (void)updateBackgroundForSelectedSegment {
    
    UIColor *newBackgroundColor;
    
    switch (self.segmentedControl.selectedSegmentIndex) {
            
        case COLOR_GREEN:
            newBackgroundColor = [UIColor greenColor];
            break;
            
        case COLOR_BLUE:
            newBackgroundColor = [UIColor blueColor];
            break;
            
        case COLOR_RED:
        default:
            newBackgroundColor = [UIColor redColor];
            break;
    }
    
    self.view.backgroundColor = newBackgroundColor;
}

/**
 * Each color enum has a corresponding title for the segmented control
 *
 * @return Color's title (i.e. "Red", "Green", etc.)
 */
- (NSString*)titleForColorIndex:(ViewControllerColors)colorIndex {
    
    switch (colorIndex) {
            
        case COLOR_GREEN:
            return @"Green";
            break;
            
        case COLOR_BLUE:
            return @"Blue";
            break;
            
        case COLOR_RED:
        default:
            return @"Red";
            break;
    }
}

- (NSString*)analyticsPageName {
    
    return [NSString stringWithFormat:@"%@ Page",
            [self titleForColorIndex:self.segmentedControl.selectedSegmentIndex]];
}

@end
