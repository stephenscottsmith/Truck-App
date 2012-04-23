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
#import "Person.h"
#import "BlockParty.h"

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
    
    NSMutableArray  *listPeople;
    Person          *selectedPerson;
    
    NSArray         *listParty;
    BlockParty      *selectedBlockParty;
    
    NSMutableArray  *listOfTrucks;
    
}

@property (nonatomic, retain) NSMutableArray *listOfTrucks;

@property (nonatomic, retain) NSArray *listContent;
@property (nonatomic, retain) NSMutableArray *filteredListContent;
@property (nonatomic, retain) Truck *selectedTruck;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;


@property (nonatomic, retain) Person *selectedPerson;
@property (nonatomic, retain) NSMutableArray *listPeople;

@property (nonatomic, retain) BlockParty *selectedBlockParty;
@property (nonatomic, retain) NSArray *listParty;

@end
