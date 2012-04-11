//
//  Truck_Tracker_AppAppDelegate.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/15/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "Truck_Tracker_AppAppDelegate.h"
#import "Truck.h"
#import "Person.h"
#import "BlockParty.h"

@implementation Truck_Tracker_AppAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize listContent, filteredListContent, savedSearchTerm, savedScopeButtonIndex, searchWasActive,
            coordinate, selectedTruck, listPeople, selectedPerson, listParty, selectedBlockParty;


/*self.tabBarController = [[UITabBarController alloc] init];
self.tabBarController.delegate=self;
self.tabBarController.selectedIndex=0;
self.tabBarController.delegate=self;*/

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSUInteger index=[[tabBarController viewControllers] indexOfObject:viewController];
    
     return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize the default coordinate to use, which is the user's current location.
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    // Initialize the mock database of trucks.
    listContent = [[NSArray alloc] initWithObjects:
                   [Truck truckWithCuisine:@"American Cuisine" name:@"Buttermilk Truck" menu:[NSData dataWithContentsOfFile:@"/Users/Steve/Desktop/Truck Tracker App/Truck Tracker App/Buttermilk Truck Menu.tiff"] latitude: [NSNumber numberWithDouble: 0.1] longitude: [NSNumber numberWithDouble: 0.1]schedule:@"7/15/12"],
                   [Truck truckWithCuisine:@"American Cuisine" name:@"In N Out Burgers" menu:[NSData dataWithContentsOfFile:@"/Users/Steve/Desktop/Truck Tracker App/Truck Tracker App/Lobsta Truck Menu.tiff"]
                                  latitude: [NSNumber numberWithDouble: 23.2] longitude: [NSNumber numberWithDouble: 80.2] schedule: nil],
                   [Truck truckWithCuisine:@"Mexican Cuisine" name:@"Hacienda Mexican" menu: nil
                                  latitude: [NSNumber numberWithDouble: 42.3] longitude: [NSNumber numberWithDouble: 64.3] schedule: nil],
                   [Truck truckWithCuisine:@"Indian Cuisine" name:@"Naboo Indian"  menu: nil
                                  latitude: [NSNumber numberWithDouble: 0.4] longitude: [NSNumber numberWithDouble: 0.4] schedule: nil],
                   [Truck truckWithCuisine:@"Italian Cuisine" name:@"Vito's Italian" menu: nil
                                  latitude: [NSNumber numberWithDouble: 33.9698156] longitude: [NSNumber numberWithDouble: -118.4185009] schedule: nil],
                   nil];
    selectedTruck = nil;
    NSLog(@"delegate: %d", [listContent count]);    
    
    //Initialize the mock database of users.
    listPeople = [[NSMutableArray alloc] initWithObjects:
                  [Person personWithEmail:@"stephen@techgroupintl.com" password:@"test" type:@"User"],
                  [Person personWithEmail:@"dondi@lmu.edu" password:@"test" type:@"Truck Owner"],
                  nil];
    selectedPerson = nil;
   
    //Initialize the mock database of block parties.
    listParty = [[NSArray alloc] initWithObjects:
                 [BlockParty blockpartyWithName:@"Westside Food Truck Central"],
                 [BlockParty blockpartyWithName:@"Venice Food Truck Paradise"], 
                nil];
    selectedBlockParty = nil;
    
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
   
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
 //   NSLog(@"Got location!");
    self.coordinate = newLocation.coordinate;
}

@end
