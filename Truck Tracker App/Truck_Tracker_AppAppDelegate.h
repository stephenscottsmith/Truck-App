//
//  Truck_Tracker_AppAppDelegate.h
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Truck.h"

/*
 * I'm committed!
 */
@interface Truck_Tracker_AppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, CLLocationManagerDelegate>
{
	NSArray			*listContent;			// The master content.
	NSMutableArray	*filteredListContent;	// The content filtered as a result of a search.

    CLLocationCoordinate2D coordinate; // The location for the map.
    Truck *selectedTruck; // The currently chosen truck.
	
	// The saved state of the search UI if a memory warning removed the view.
    NSString		*savedSearchTerm;
    NSInteger		savedScopeButtonIndex;
    BOOL			searchWasActive;
    
}

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) NSInteger savedScopeButtonIndex;
@property (nonatomic) BOOL searchWasActive;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) Truck *selectedTruck;

@end
