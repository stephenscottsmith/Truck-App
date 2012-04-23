//
//  TruckDetailViewController.m
//  Truck Tracker App
//
//  Created by Stephen Smith on 9/29/11.
//  Copyright 2011 Parthenon Productions. All rights reserved.
//

#import "TruckDetailViewController.h"
#import "ContactViewController.h"
#import "MenuViewController.h"
#import "BlockPartyViewController.h"
#import "TruckMapViewController.h"
#import "ScheduleViewController.h"
#import "Truck_Tracker_AppAppDelegate.h"

#import "TrucksViewController.h"
#import "FavoritesViewController.h"

@implementation TruckDetailViewController

@synthesize truck;
@synthesize cuisineTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@ (%@)", self.truck.name, self.truck.cuisine);
    cuisineTextField.text = self.truck.cuisine;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)displayContact:(id)sender
{
    ContactViewController *detailsViewController = [[ContactViewController alloc] initWithNibName:@"ContactView" bundle:nil];
    

	detailsViewController.title = @"Contact";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)displayMenu:(id)sender
{
    MenuViewController *detailsViewController = [[MenuViewController alloc] initWithNibName:@"MenuView" bundle:nil];
    
    
	detailsViewController.title = @"Menu";
    detailsViewController.menuUIImage = [UIImage imageWithData:truck.menu];
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)displayMap:(id)sender
{
    // Instead of this code, replace it with code that:
    // (a) Assigns the truck's coordinate to the app delegate's coordinate.
    // (b) Switches the view to the tab bar controller's map view.
    Truck_Tracker_AppAppDelegate *delegate = (Truck_Tracker_AppAppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.coordinate = truck.coordinate;
    delegate.selectedTruck = truck;
    delegate.tabBarController.selectedViewController = [delegate.tabBarController.viewControllers objectAtIndex:1];
}

-(IBAction)displaySchedule:(id)sender
{
    ScheduleViewController *detailsViewController = [[ScheduleViewController alloc] initWithNibName:@"ScheduleView" bundle:nil];
    
    
	detailsViewController.title = @"Schedule";
    
    [[self navigationController] pushViewController:detailsViewController animated:YES];
    [detailsViewController release];
}

-(IBAction)addTruckToFavorites:(id)sender
{
    [((Truck_Tracker_AppAppDelegate *)[UIApplication sharedApplication].delegate).listOfTrucks addObject: self.truck];

}

@end
